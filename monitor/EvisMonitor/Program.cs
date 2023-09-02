using Azure;
using Azure.Data.AppConfiguration;
using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;
using EmailService;
using EvisMonitor.Model;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Security.Claims;
using System.Security.Cryptography.X509Certificates;

namespace EvisMonitor
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            Console.WriteLine(Environment.GetEnvironmentVariable("azure"));
            IConfiguration configuration = new ConfigurationBuilder()
            .AddAzureAppConfiguration(options =>
            {
                options.Connect(Environment.GetEnvironmentVariable("azure"));
            }).Build();

            configuration["key:encryption"] = "1234567890123456";

            Encryptor.EncryptionKey = configuration["key:encryption"];

            (new List<string> { "key:jwt-issuer", "email:Password", "MicrosoftAppPassword", "mysql",
            "notificationhub:ConnectionString", "queue", "razor:secret", "storage:endpoint", "storage:secret"}).
            ForEach(key => configuration[key] = Encryptor.Decrypt(configuration[key]));

            var services = new ServiceCollection();
            services.AddTransient<IEmailSender, EmailSender>();
            services.Configure<EmailConfiguration>(configuration.GetSection("email"));

            var serviceprovider = services.BuildServiceProvider();
            Console.WriteLine("started");

            try
            {
                string[] files = Directory.GetFiles(Constants.MySqlBackupPath, "*");

                using (FileStream stream = File.OpenRead(files[0]))
                {
                    string blobname = DateTime.Now.ToString("ddMMMyyyy") + "." + Path.GetExtension(files[0]);
                    blobname = blobname.Replace("..", ".");
                    Uri Uri = await UploadBlob(configuration["storage:endpoint"], "mysqlbackup", stream, "", blobname, false, false);
                    if (string.IsNullOrEmpty(Uri.AbsoluteUri))
                    {
                        Console.WriteLine(Uri.AbsoluteUri);
                        await SendMailNotification(configuration, serviceprovider, Uri.AbsoluteUri);
                    }
                    else
                    {
                        Console.WriteLine("No URL");
                        await SendMailNotification(configuration, serviceprovider, "No URL");
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                await SendMailNotification(configuration, serviceprovider, e.Message);
            }
        }

        static async Task<Uri> UploadBlob(string connstring, string containerName, Stream content, string contentType, string blobname, bool ispublic = false, bool ishottier = false)
        {

            try
            {
                BlobServiceClient _blobServiceClient = new BlobServiceClient(connstring);
                BlobContainerClient containerClient = _blobServiceClient.GetBlobContainerClient(containerName);
                containerClient.CreateIfNotExists(ispublic ? PublicAccessType.BlobContainer : PublicAccessType.None);
                BlobClient blobClient = containerClient.GetBlobClient(blobname);

                BlobUploadOptions options = new BlobUploadOptions()
                {
                    AccessTier = ishottier ? AccessTier.Hot : AccessTier.Cool,
                    HttpHeaders = new BlobHttpHeaders { ContentType = contentType }
                };

                await blobClient.UploadAsync(content, options);
                Console.WriteLine(blobClient.Uri);
                return blobClient.Uri;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
            return null;
        }

        static async Task<bool> SendMailNotification(IConfiguration configuration, IServiceProvider serviceProvider, string url)
        {
            try
            {
                StreamReader str = new StreamReader(Constants.MailTemplatePath);
                string MailText = str.ReadToEnd();
                str.Close();

                var request = new MailRequest()
                {
                    message = url,
                    subject = "Evis Mysql Daily Backup Report"
                };

                var toMail = new List<string>() { configuration.GetSection("email:ContactFormTo").Value.ToString() };

                MailText = MailText.Replace("[subject]", request.subject);
                MailText = MailText.Replace("[message]", request.message);

                var message = new Message(toMail, request.subject, MailText, null);
                IEmailSender emailSender = serviceProvider.GetService<IEmailSender>();
                await emailSender.SendEmailAsync(message);
            }
            catch (Exception e)
            {
                var c = e;
            }
            return false;
        }


    }
}
