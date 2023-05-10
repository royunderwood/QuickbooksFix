# Pgtech QuickbooksApp-Fixer                                                                                                                                                      
#                                                                                                                                                                                 
# By: Roy Underwood 
# Revision: 1.4 January 26, 2022 --> PREV <-- December 30 2021  
#                                                                                                                                                                                 
# This script will:                                                                                                                                                               
# Stop DNS, Reset Quickbooks DB Serves & Monitor to Automatic Start                                                                                                               
# Reserve Ports for DNS and Deletes .ND & .TLG Files                                                                                                                              
# Restart All QuickBooks Services and DNS                                                                                                                                         
#                                                                                                                                                                                 
                                                                                                                                                                                  
Stop-Service -Name "DNS"                                                                                                                                                          
Stop-Service -Name "QuickBooksDB32"                                                                                                                                               
Stop-Service -Name "QBWCMonitor"                                                                                                                                                  
Stop-Service -Name "QBCFMonitorService"                                                                                                                                           
                                                                                                                                                                                  
c:\windows\system32\netsh.exe exec fixports.bat                                                                                                                        
c:\windows\system32\netsh.exe exec fixports2.bat                                                                                                                       

#Put Your Path and File name to your Company Files
Remove-Item -Force '.ND'                                                                                  
Remove-Item -Force '.TLG'                                                                                 

#Put your Path to Your Quickbooks Version, Reboot.bat is quickbooks installed
c:\windows\system32\netsh.exe exec 'C:\Program Files\Intuit\QuickBooks Enterprise Solutions 22.0\reboot.bat'                                                                      
                                                                                                                                                                                  
ReStart-Service -Name "QuickBooksDB32"                                                                                                                                            
Restart-Service -Name "QBWCMonitor"                                                                                                                                               
Restart-Service -Name "QBCFMonitorService"                                                                                                                                        
ReStart-Service -Name "DNS"                                                                                                                                                       
                                                                                                                                                                                  
Set-Service -Name QuickBooksDB32 -Computer pngserver01 -StartupType "Automatic"                                                                                                   
Set-Service -Name QBWCMonitor -Computer pngserver01 -StartupType "Automatic"                                                                                                      
Set-Service -Name QBCFMonitorService -Computer pngserver01 -StartupType "Automatic"                                                                                               
Set-Service -Name DNS -Computer pngserver01 -StartupType "Automatic"  
 
