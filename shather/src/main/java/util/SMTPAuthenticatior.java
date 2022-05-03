package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticatior extends Authenticator {

	protected PasswordAuthentication getPasswordAuthentication()

	{
		return new PasswordAuthentication("bluedot9456", "Dpm9456@@");
	}
}
