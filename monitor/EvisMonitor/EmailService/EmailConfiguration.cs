﻿namespace EmailService
{
    public class EmailConfiguration
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string SmtpServer { get; set; }
        public int Port { get; set; }
        public string ContactFormTo { get; set; }
    }
}
