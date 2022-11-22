#include <iostream>
#include <tins/tins.h>
using namespace std;

using namespace Tins;
bool callback(const PDU &pdu) {
    const IP &ip = pdu.rfind_pdu<IP>();
    const TCP &tcp = pdu.rfind_pdu<TCP>();
    cout << ip.src_addr() << ':' << tcp.sport() << " -> " 
         << ip.dst_addr() << ':' << tcp.dport() << endl;
    return true;
}

int main() {
    // Sniff on interface eth0
    Sniffer sniffer("eth0");
    sniffer.sniff_loop(callback);
}