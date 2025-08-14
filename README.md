**System Resource Monitor** (PowerShell Script)

A beginner PowerShell script that checks CPU, RAM, and Disk Usage and saves results to a .txt file on the desktop

---

Features:

- Monitors current **CPU usage**
- Reports **used and total RAM**
- Displays **disk usage per drive** (used, free, total)
- Outputs results to a **text file with current date**

---

Output Example:

This script will create a "system-report_2025-08-14.txt" file that looks like this 




=== System Resource Report (2025-08-14 10:49:20) ===
CPU Load: 5.25%
RAM: 9.68 GB used / 31.09 GB total

Disk Usage:

Drive UsedGB FreeGB TotalGB

C     443.54  21.48  465.02
D     795.68 135.83  931.51


















to-do:
- automate with task scheduler to run script at a fixed interval
- add more metrics?
- 

Changes:
*updated script to include the date in file name of the output folder



## 📂 Output Example

The script creates a file like this on your desktop:

