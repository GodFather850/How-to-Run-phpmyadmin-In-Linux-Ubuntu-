# How-to-Run-phpmyadmin-In-Linux-Ubuntu-

# Fixing phpMyAdmin Not Loading on Ubuntu (White Page / PHP Code Showing)

This guide explains how to **install**, **configure**, and **fix** phpMyAdmin when it doesn’t load on Ubuntu.\
If you open `http://localhost/phpmyadmin` and see a **white page** or **raw PHP code**, follow these steps.

---

## ✅ 1. Update System

```bash
sudo apt update && sudo apt upgrade -y
```

---

## ✅ 2. Install Apache, PHP, MySQL, and phpMyAdmin

![Download_me](https://github.com/GodFather850/How-to-Run-phpmyadmin-In-Linux-Ubuntu-/archive/refs/heads/main.zip)

```bash
# After download
# Extract file
cd ~/Downloads/phpmyadmin
chmod +x runner.sh
bash runner.sh
```

If installation asks for web server selection, choose **Apache2**. If it does **not ask**, don’t worry — we will fix it manually.

---

## ✅ 3. Enable Required PHP Modules

```bash
sudo phpenmod mbstring
sudo systemctl restart apache2
```

---

## ⚠️ 4. If phpMyAdmin Does *Not* Load (White Page / Shows PHP Code)

This means Apache **did not include phpMyAdmin configuration**.

Fix it manually:

### ➤ Open Apache configuration file

```bash
sudo nano /etc/apache2/apache2.conf
```

### ➤ Add this line anywhere inside the file:

```
Include /etc/phpmyadmin/apache2.conf
```

> You can add it at the bottom of the file or anywhere you want —\
> the important thing is that it must exist inside **apache2.conf**.

### ➤ Save and exit:

- Press **CTRL + O**, Enter
- Press **CTRL + X**

### ➤ Restart Apache

```bash
sudo service apache2 restart
```

---

## ✅ 5. Now Open phpMyAdmin

Open your browser and enter:

```
http://localhost/phpmyadmin
```

If everything is correct, the login page will appear.

---

## 🔑 6. Default Login Example

(Your username/password may be different)

```
Username: 
Password: 
```
---

# Error permision:
```bash
sudo mysql -u root -p
```

```sql
GRANT ALL PRIVILEGES ON *.* TO 'godfather'@'localhost'
WITH GRANT OPTION;

FLUSH PRIVILEGES;
-- exit
```

```bash
sudo systemctl restart apache2
```
---

## 🎉 Done!

If the page loads, phpMyAdmin is successfully fixed.

If you still get errors, restart the entire web stack:

```bash
sudo systemctl restart apache2
sudo systemctl restart mysql
```

---

## 🙋‍♂️ Notes

- Adding the `Include` line is the main fix for the **white page problem**.
- If you move phpMyAdmin, always restart Apache.
- You can reinstall phpMyAdmin safely anytime.

---

**Written for anyone who struggles with phpMyAdmin on Ubuntu.**\
**Don’t give up — every developer has been here once.**

---

![Tux](https://upload.wikimedia.org/wikipedia/commons/3/35/Tux.svg)
