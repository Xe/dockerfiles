dockerfile-mailserver
=====================

Dockerfile to make mailserver powered by postfix / dovecot .

How to use
-----------

1. Download.

  ```bash
  git clone https://github.com/3846masa/dockerfile-mailserver.git
  ```
  OR
  ```bash
  curl -O -L https://github.com/3846masa/dockerfile-mailserver/archive/master.zip
  unzip master.zip
  ```

2. Make image.

  ```bash
  cd {folder of download files.}
  docker build -t 3846masa/mailserver .
  ```

3. Make folder and Run

  ```bash
  mkdir /mailfolder # Anywhere
  docker run -it -v /mailfolder:/home/vmail -p 25:25 -p 110:110 -p 143:143 -p 587:587 --name "mailserver" 3846masa/mailserver
  Hostname: mail.example.com
  Domainname: example.com
  ```

4. Add users

  ```bash
  addmailuser user@mail.example.com
  Enter user password: 
  Retype user password: 
  ```

5. Set mail client

  Please check below.

6. (Delete users)

  If you will delete users, type below.
  ```bash
  delmailuser user@mail.example.com
  ```

7. Run as background

  If you will escape mailserver's terminal, send Ctrl+P and Ctrl+Q.

  **DO NOT EXECUTE ``exit``!!!!!**

8. Enter mailserver's terminal

  ```bash
  docker attach "mailserver"
  ```

Mail client settings
--------------------

- Username: user@mail.example.com
- Password: [Password]
- SSL and TLS is not supported.

Type | Port
---- | ----
POP3 | 110
IMAP | 143
SMTP | 25 and 587
