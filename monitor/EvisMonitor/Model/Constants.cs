using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EvisMonitor.Model
{
    public class Constants
    {
        public static string MySqlBackupPath = Path.Combine("/mysqlbackup", DateTime.Now.ToString("ddMMMyyyy"));

        public static string MailTemplatePath = Path.Combine(Directory.GetCurrentDirectory(), "EmailTemplates" , "send_mail_notification.html");
    }
}
