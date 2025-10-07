#!/bin/bash
yum update -y
yum install -y httpd php php-mysqli

systemctl enable httpd
systemctl start httpd


cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>My Portfolio</title>
  <style>
    /* Add animation and styling for the text */
    @keyframes colorChange {
      0% { color: red; }
      50% { color: green; }
      100% { color: blue; }
    }
    h1 {
      animation: colorChange 2s infinite;
    }
  </style>
</head>
<body>
  <h1>Terraform Project</h1>
  <h2>Welcome to My Application from: <span style="color:green"> $(hostname -f)</span></h2>
  <p>Thank you for your time!!!</p>
  <p><a href="dbtest.php">Test DB Connection</a></p>

</body>
</html>
EOF


cat <<EOF > /var/www/html/dbtest.php
<?php
\$host = "${db_host}";
\$user = "${db_user}";
\$password = "${db_password}";
\$dbname = "${db_name}";

\$conn = new mysqli(\$host, \$user, \$password, \$dbname);

if (\$conn->connect_error) {
    die("Connection failed: " . \$conn->connect_error);
}

\$result = \$conn->query("SELECT NOW() AS CurrentTimestamp");
\$row = \$result->fetch_assoc();
echo "<h1>Database Time: " . \$row['CurrentTimestamp'] . "</h1>";

\$conn->close();
?>
EOF