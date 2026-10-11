# Ethical Hacking Lab — Practical Viva Quick Guide (Experiments 1–10)

A short, practical-first guide for revising the Ethical Hacking (EH) lab viva. Each experiment includes the aim, steps, commands/code where appropriate, expected output, and key viva points.

> **Safety and lab scope:** Run scans and tests only on localhost, systems you own, or targets for which you have explicit permission. Use an isolated lab VM and deliberately vulnerable applications for vulnerability demonstrations. Do not attack public websites, college networks, or other people's devices.

## Table of Contents

1. [Experiment 1 — Ethical Hacking Tools](#experiment-1--ethical-hacking-tools)
2. [Experiment 2 — Footprinting, RSA, and SQL Injection](#experiment-2--footprinting-rsa-and-sql-injection)
3. [Experiment 3 — Python Input-Capture Demo and Nessus](#experiment-3--python-input-capture-demo-and-nessus)
4. [Experiment 4 — DoS Concepts and Prevention](#experiment-4--dos-concepts-and-prevention)
5. [Experiment 5 — ARP Poisoning Concepts and ARP Analysis](#experiment-5--arp-poisoning-concepts-and-arp-analysis)
6. [Experiment 6 — Metasploit Framework](#experiment-6--metasploit-framework)
7. [Experiment 7 — Nmap Scan Types](#experiment-7--nmap-scan-types)
8. [Experiment 8 — HTTP Session Inspection in Firefox](#experiment-8--http-session-inspection-in-firefox)
9. [Experiment 9 — Wireshark Packet Capture](#experiment-9--wireshark-packet-capture)
10. [Experiment 10 — Wireshark Challenges](#experiment-10--wireshark-challenges)
11. [Last-Minute Viva Revision](#last-minute-viva-revision)

---

## Experiment 1 — Ethical Hacking Tools

**Aim:** Demonstrate common ethical hacking and network-security tools.

Tools in the syllabus: Nmap, Metasploit, Burp Suite, Angry IP Scanner, Ettercap, LANguard, and Network Stumbler.

### Steps

1. Open Kali Linux or your lab machine.
2. Check whether Nmap and Metasploit are installed.
3. Scan your own computer using Nmap.
4. Open Burp Suite, use its built-in browser, and inspect requests to a local test website.
5. If other listed tools are not installed, explain their purpose and show them only where available. Some tools are Windows-specific or legacy.

### Commands

```bash
nmap --version
msfconsole --version
nmap 127.0.0.1
```

### Expected output

- Nmap prints its version and scan summary, including ports it can identify.
- Metasploit opens its console or prints its version.
- Burp Suite's HTTP history shows requests and responses from the test browser.

### Viva points

- **Nmap:** host and port discovery, with optional service/version detection.
- **Metasploit:** framework for security testing using modules.
- **Burp Suite:** web application testing proxy.
- **Angry IP Scanner:** discovers hosts in a specified network range.
- **Ettercap:** network traffic analysis and authorized man-in-the-middle testing.
- **LANguard:** network security scanning product (legacy naming/version may vary).
- **Network Stumbler:** legacy wireless-network discovery tool.

---

## Experiment 2 — Footprinting, RSA Encryption/Decryption, and SQL Injection

### A. Footprinting and reconnaissance

**Aim:** Collect publicly available domain/DNS information and identify services on an authorized target.

```bash
whois example.com
nslookup example.com
nmap -sV 127.0.0.1
```

### Steps

1. Run `whois` to see available registration information for a domain.
2. Run `nslookup` to query DNS.
3. Run Nmap service detection against localhost or your own lab VM.
4. Record the commands and the key fields shown in the output.

**Expected output:** Domain/registration data where available, DNS answers, and detected services/ports. Privacy protection or network restrictions can limit results.

### B. RSA using CrypTool

**Aim:** Encrypt a message with an RSA public key and decrypt it with the matching private key.

1. Open CrypTool.
2. Generate an RSA key pair (public and private keys).
3. Enter a short test message such as `HELLO`.
4. Encrypt it using the public key.
5. Decrypt the ciphertext using the matching private key.

**Expected output:** Ciphertext after encryption; the original message `HELLO` after successful decryption.

**Viva point:** RSA is asymmetric cryptography. The public key can encrypt; the matching private key can decrypt. Real systems use secure padding and usually encrypt data with a symmetric key rather than RSA-encrypting large files directly.

### C. SQL injection in a deliberately vulnerable local app

**Aim:** Understand how unsafe query construction can let input change SQL query logic.

1. Start a deliberately vulnerable lab app such as DVWA locally.
2. Log in and set the lab's SQL Injection exercise to its intended training level.
3. Enter a normal test ID and observe the result.
4. Compare it with a harmless training input provided by the lab instructions.
5. Explain the behavior and show how parameterized/prepared statements prevent injection.

**Expected output:** The app displays a result for the selected input and demonstrates how unsafe query construction can alter query logic.

**Safety:** Do not test SQL injection against public websites or systems without explicit authorization.

---

## Experiment 3 — Python Input-Capture Demo and Nessus

### A. Visible Python input-capture demonstration

**Aim:** Demonstrate reading user-provided text in Python. This is a safe teaching demo, not a covert keylogger.

Create `keydemo.py`:

```python
text = input("Type a test message: ")
print("Captured test input:", text)
```

Run it:

```bash
python3 keydemo.py
```

**Sample output:**

```text
Type a test message: hello
Captured test input: hello
```

**Viva point:** A real keylogger records keystrokes and can violate privacy. This simple program only reads text intentionally typed into its own terminal.

### B. Nessus vulnerability scanner

**Aim:** Scan an authorized lab machine for known vulnerabilities and configuration issues.

1. Start the Nessus service using the method appropriate for your installation.
2. Open the local Nessus web interface, commonly `https://localhost:8834`.
3. Sign in.
4. Create a **Basic Network Scan**.
5. Set the target to `127.0.0.1` or an authorized lab VM.
6. Launch the scan and review findings by severity.

**Expected output:** A findings list with severity, plugin details, and remediation guidance. Results vary by host and scan configuration.

**Viva point:** A clean scan does not prove a system is vulnerability-free; scanners have coverage limits and false positives/negatives.

---

## Experiment 4 — DoS Concepts, Demonstration of Request Handling, and Prevention

**Aim:** Understand resource exhaustion and methods used to defend a server.

This safe demonstration shows ordinary HTTP request handling; it is **not** a DoS attack.

### Steps

1. In terminal 1, start a local HTTP server:

```bash
python3 -m http.server 8000 --bind 127.0.0.1
```

2. In terminal 2, send one request:

```bash
curl -i http://127.0.0.1:8000/
```

3. Observe the HTTP response and the server log.
4. Explain that a real DoS attempts to exhaust resources such as bandwidth, CPU, memory, or connection slots.
5. Discuss prevention and monitoring.

**Expected output:** HTTP response headers, commonly including `200 OK`, plus a request entry in the server terminal.

### Preventive measures

- Rate limiting and connection limits.
- Firewalls and web application firewalls (where suitable).
- Timeouts and resource limits.
- Reverse proxies and DDoS mitigation services.
- Logging, alerting, and incident-response procedures.

**Safety:** Do not flood a Windows server or any other system. A real attack simulation should be performed only in an isolated, instructor-approved environment.

---

## Experiment 5 — ARP Poisoning Concepts and ARP Traffic Analysis

**Aim:** Understand ARP and observe address-resolution traffic.

### Steps on Windows

1. Open Command Prompt.
2. Display the local ARP cache:

```cmd
arp -a
```

3. Open Wireshark and choose your authorized lab interface.
4. Start a capture and use the display filter:

```text
arp
```

5. Communicate with a lab device or generate ordinary local traffic.
6. Observe ARP requests and replies and identify sender/target protocol addresses and hardware addresses.

**Expected output:** ARP packets and IP-to-MAC address mappings.

**Viva points**

- **ARP:** maps an IPv4 address to a MAC address on a local network.
- **ARP poisoning:** attempts to corrupt ARP mappings so traffic may be misdirected.
- **Defences:** Dynamic ARP Inspection on supported switches, segmentation, secure switch configuration, and monitoring.

A normal ARP capture does not prove poisoning took place. Only perform any poisoning simulation in an isolated lab with instructor permission.

---

## Experiment 6 — Metasploit Framework

**Aim:** Explore Metasploit's console, modules, options, and authorized scanning.

### Steps

1. Open Kali Linux.
2. Start the console:

```bash
msfconsole
```

3. At the Metasploit prompt, enter:

```text
help
search type:auxiliary scanner
```

4. Inspect a TCP port scanner module:

```text
info auxiliary/scanner/portscan/tcp
```

5. Select it and inspect its options:

```text
use auxiliary/scanner/portscan/tcp
show options
```

6. For a scan, set the target to your authorized lab VM's IP and configure the required options shown by `show options`. Run it only against that lab target.

**Expected output:** Module details/options, and—if run against a reachable authorized target—possible open-port results.

### Viva points

- **Exploit:** code or a technique that takes advantage of a vulnerability.
- **Payload:** code executed after successful exploitation.
- **Meterpreter:** an advanced interactive payload/session.
- **Auxiliary module:** supporting functionality such as scanning or service enumeration.
- **Armitage:** a graphical interface for Metasploit, depending on the version and installation.

For Android, Windows, and Linux, explain that module compatibility depends on OS, architecture, services, and the vulnerability. Use instructor-provided vulnerable VMs for exploitation demonstrations.

---

## Experiment 7 — Nmap SYN, ACK, FIN, NULL, and XMAS Scans

**Aim:** Demonstrate different Nmap TCP scan flags on a machine you own.

### Prepare a local listening port

Start a local web server in terminal 1:

```bash
python3 -m http.server 8000 --bind 127.0.0.1
```

### Run scans in terminal 2

```bash
nmap -sS -p 8000 127.0.0.1
nmap -sA -p 8000 127.0.0.1
nmap -sF -p 8000 127.0.0.1
nmap -sN -p 8000 127.0.0.1
nmap -sX -p 8000 127.0.0.1
```

Raw-packet scans may require elevated privileges. Use the correct privilege method for your OS.

### Scan flags

| Flag | Meaning |
|---|---|
| `-sS` | SYN scan |
| `-sA` | ACK scan |
| `-sF` | FIN scan |
| `-sN` | NULL scan |
| `-sX` | XMAS scan |
| `-p 8000` | Scan port 8000 |

**Expected output:** Nmap displays a port state such as `open`, `closed`, `filtered`, or `unfiltered`. Results depend on the scan type, firewall, OS, and network path. ACK scans primarily help map filtering; they do not directly determine whether a port is open.

**Viva point:** A SYN scan sends an initial SYN packet and infers the state from the response without completing a normal TCP connection.

---

## Experiment 8 — Session Inspection Using Firefox Developer Tools

**Aim:** Inspect web requests and understand session-related security. The old Tamper Data add-on may not work with current Firefox versions, so Developer Tools are a practical alternative.

### Steps

1. Open a local test web application using a test account.
2. Press `F12` to open Firefox Developer Tools.
3. Select the **Network** tab.
4. Reload the page or submit a form.
5. Select a request and inspect its headers, parameters, cookies, and response.
6. Change a harmless field in your own test application and observe the resulting request.

**Expected output:** A list of HTTP requests and their headers, parameters, and responses.

**Viva points**

- **Session:** state associated with a user's interaction with an application.
- **Session token/cookie:** often used by the server to associate requests with a session.
- **Session hijacking/impersonation:** unauthorized use of another user's session.
- **Defences:** HTTPS, Secure and HttpOnly cookie attributes, appropriate SameSite settings, session rotation after authentication, and server-side session expiry.

Do not copy, replay, or tamper with another person's session credentials.

---

## Experiment 9 — Wireshark Packet Capture and Analysis

**Aim:** Capture network packets and inspect protocol information.

### Steps

1. Open Wireshark.
2. Select your active interface (or loopback interface for localhost traffic).
3. Start capturing.
4. Generate test traffic using a terminal:

```bash
ping -c 4 127.0.0.1
```

On Windows:

```cmd
ping 127.0.0.1
```

5. Stop the capture.
6. Apply display filters:

```text
icmp
dns
tcp
arp
http
```

7. Select a packet and expand its protocol details.

**Expected output:** A packet list with time, source, destination, protocol, length, and information columns.

### Useful filters

| Filter | Shows |
|---|---|
| `icmp` | ICMP packets, including many ping packets |
| `dns` | DNS queries and responses |
| `tcp` | TCP packets |
| `arp` | ARP packets |
| `http` | HTTP protocol traffic that Wireshark can dissect |

**Note:** `127.0.0.1` traffic may appear on the loopback interface rather than a physical Wi-Fi/Ethernet interface. HTTPS content is encrypted; Wireshark generally cannot show the plaintext application data without appropriate decryption material.

---

## Experiment 10 — Wireshark Challenges

**Aim:** Identify protocols, packet fields, and basic communication behavior.

### Steps

1. Capture traffic while pinging localhost or a lab VM.
2. Apply `icmp`.
3. Identify the source address, destination address, packet type, and sequence number where applicable.
4. Apply `dns`, `tcp`, and `arp` filters and compare the packets.
5. Select a packet and inspect the protocol layers in the details pane.

### Quick challenge questions

| Question | Answer |
|---|---|
| Which protocol is commonly used by ping? | ICMP |
| Which protocol resolves domain names? | DNS |
| Which protocol provides reliable, connection-oriented delivery? | TCP |
| Which protocol maps local IPv4 addresses to MAC addresses? | ARP |
| What is a packet capture file? | A file storing captured packets, commonly `.pcap` or `.pcapng` |
| What is a display filter? | A rule controlling which captured packets are shown |
| What does a source IP represent? | The packet's apparent sender IP address |
| What does a destination IP represent? | The packet's intended destination IP address |

**Expected output:** Filtered packet lists and the selected packet's protocol fields.

---

## Last-Minute Viva Revision

### Commands to remember

```bash
# Check tool versions and scan localhost
nmap --version
nmap 127.0.0.1

# DNS and service discovery
nslookup example.com
nmap -sV 127.0.0.1

# Metasploit
msfconsole

# Start a local HTTP server
python3 -m http.server 8000 --bind 127.0.0.1

# Test the local HTTP server
curl -i http://127.0.0.1:8000/

# Ping localhost on Linux
ping -c 4 127.0.0.1

# Inspect ARP mappings on Windows
arp -a
```

### Core concepts

- **Ethical hacking:** authorized security testing to identify and help fix weaknesses.
- **Footprinting:** collecting information about a target.
- **Port scanning:** identifying reachable ports and, in some cases, services.
- **Encryption:** converting readable data into ciphertext.
- **Decryption:** recovering plaintext using the appropriate key.
- **SQL injection:** changing query behavior through unsafe handling of input.
- **DoS:** exhausting a service's resources so legitimate users cannot access it.
- **ARP poisoning:** corrupting IP-to-MAC mappings on a local network.
- **Vulnerability scanner:** checks systems for known vulnerabilities and configuration issues.
- **Packet sniffing:** capturing network traffic for analysis.
- **Penetration test report:** documents scope, methodology, findings, severity, evidence, and remediation.

### A simple format for answering the examiner

For each experiment, say:

1. **Aim:** What the experiment demonstrates.
2. **Tool:** Which tool or language you used.
3. **Procedure:** The important steps or command.
4. **Output:** What appeared and what it means.
5. **Prevention:** How the relevant vulnerability can be mitigated, if applicable.

