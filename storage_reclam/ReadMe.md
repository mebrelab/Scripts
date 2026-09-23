Deep_Cleanup.bat
A high-efficiency Batch script designed to automate storage reclamation, component store reduction, temporary cache purging, network cache flush, and drive optimization across local system drives (C: and D:) in Windows.

Technical Overview
The script executes a targeted 5-stage maintenance protocol requiring elevated privileges:

EFS Cipher Cleanup: Removes leftover encryption temp directories (EFSTMPWP) on drives C: and D:.

Component Store Reduction: Executes DISM with /StartComponentCleanup /ResetBase to purge superseded Windows Update components and reclaim system storage space.

Automated Storage Cleanup: Invokes Windows Disk Cleanup (cleanmgr /autoclean) for automated system file purging.

Cache & DNS Purge: Removes temporary files from user and system temp directories (%TEMP%, C:\Windows\Temp) and flushes the local DNS resolver cache (ipconfig /flushdns).

Drive Optimization & Retrim: Runs defrag /O on drives C: and D:, automatically issuing TRIM commands for SSDs or defragmentation passes for HDDs.

Requirements
Operating System: Windows 10, Windows 11, or Windows Server.

Privileges: Administrator privileges (Elevated Command Prompt).

Storage Configuration: Assumes standard drive mapping for drive C: and optional drive D:.

Installation & Execution
Download / Clone: Save Deep_Cleanup.bat to your local environment.

Run as Administrator:

Right-click Deep_Cleanup.bat.

Select Run as administrator.

Warning & Caveats
DISM ResetBase Operation: Stage 2 executes Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase. This operation permanently removes superseded Windows Update components. Once executed, existing installed Windows updates cannot be uninstalled or rolled back.

Drive Letter Dependency: Stage 1 and Stage 5 explicitly target drives C: and D:. If drive D: is not present or assigned to an optical/removable drive, non-fatal warnings may appear in the console.

License
Distributed under the MIT License. See LICENSE for more information.