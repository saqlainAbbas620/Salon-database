# Salon Appointment Scheduler

A Bash script interface that connects to a PostgreSQL database to manage client appointments for a hair salon. This project was built as part of the **Relational Database Certification** curriculum on freeCodeCamp.

## 🚀 Features

- **Dynamic Validation Loop**: Re-prompts the user with the menu options if an invalid service ID is chosen.
- **Automated Customer Onboarding**: Automatically detects new customers by phone number, prompts for their name, and creates a database profile on the fly.
- **Relational Data Mapping**: Links appointments seamlessly to distinct service IDs and customer IDs.
- **Clean Command-Line Interface**: Designed natively using Bash script styling conventions without cluttering screens.

## 🛠️ Database Schema

The relational architecture consists of three interconnected tables using primary and foreign key constraints:

- **`services`**: Contains the standard catalog of salon treatments (`cut`, `color`, `perm`, `style`, `trim`).
- **`customers`**: Stores unique phone numbers and corresponding client names.
- **`appointments`**: Handles scheduled times, mapping a `customer_id` directly to a `service_id`.

## 📦 Prerequisites & Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com
   cd salon-appointment-scheduler
   ```

2. **Initialize the Database**: Ensure PostgreSQL is running locally and rebuild your schema using the following schema outline:
   ```bash
   psql -U postgres -c "CREATE DATABASE salon;"
   psql -U postgres -d salon -f salon.sql
   ```
   *(Note: Ensure your `services` table contains at least the 5 primary menu options).*

3. **Set Execution Permissions**: Give your local operating system permission to run the script file:
   ```bash
   chmod +x salon.sh
   ```

## 🎮 Usage

Execute the program straight from your root workspace terminal using the standard runtime link:

```bash
./salon.sh
```

### Script Workflow Example:
```text
~~~~~ MY SALON ~~~~~

Welcome to my Salon, how can I help you?

1) cut
2) color
3) perm
4) style
5) trim

Please Enter your service:
1

Please Enter your Phone no:
555-555-5555

I don't have a record for that phone number, Please Enter your name:
Fabio

What time would you like your cut, Fabio?
10:30

I have put you down for a cut at 10:30, Fabio.
```

## 📝 Technologies Used

- **Bash Scripting**: Interface wrapper logic, validation loops, and command line substitutions.
- **PostgreSQL**: Relational storage backbone handling query matches, insertions, and table mapping.
```

---

To make sure this fits your GitHub repository perfectly, let me know:
* Do you want to add a section showing **how to backup or dump the database schema (`salon.sql`)** to your repository?
* Would you like to include your **name or GitHub username** in a specific "Author" section at the bottom?
