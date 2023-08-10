<p align="center">
  <pre>
				=======================================================
				=                                                     =
				=         LFI_scanner v 0.1.5 by Hood3dRob1n          =
				=           ~[ Updated Version by kvzlx ]~            =
				=                                                     =
				=======================================================

  </pre>
</p>



This is a simple Perl script that scans for Local File Inclusion (LFI) vulnerabilities on web applications. It can help identify potential security weaknesses in web applications' file inclusion mechanisms.

This script was originally inspired by a blog post on [Kaotic Creations](http://kaoticcreations.blogspot.com/2011/08/automated-lfirfi-scanning-exploiting.html), and it has been modified by Me for personal use.

## Disclaimer

**Use this script responsibly and ethically.** Unauthorized scanning of websites and exploitation of vulnerabilities without proper authorization is illegal and unethical. This script is provided for educational and informational purposes only. The author and contributors are not responsible for any misuse or damage caused by this script.

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/kvlx-alt/LFI-Scanner.git
   ```

2. Navigate to the repository directory:

   ```bash
   cd LFI-Scanner
   ```

3. Run the script:

   ```bash
   perl lfi_scanner.pl
   ```

4. Follow the prompts to enter the target site URL and the path to the wordlist file (/usr/share/seclists/Fuzzing/LFI/LFI-Jhaddix.txt).

5. The script will scan for LFI vulnerabilities and provide a summary of the results at the end.

   

## Credits

- Original script source: [Kaotic Creations Blog](http://kaoticcreations.blogspot.com/2011/08/automated-lfirfi-scanning-exploiting.html)
- Script modification and customization: [kvzlx](https://github.com/kvlx-alt)
