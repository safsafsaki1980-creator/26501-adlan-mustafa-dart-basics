
// Student: mustafa eliass abdulhalim adlan
// Reg no:  26501
const String regNo = '26501';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int momoFee(int amount) {
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

String maskPhone(String phone) {
  if (phone.length != 10) {
    return 'INVALID';
  }

  String stars = List.filled(phone.length - 5, '*').join();

  return phone.substring(0, 3) +
      stars +
      phone.substring(phone.length - 2);
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  int i = 1;
  int totalFees = 0;
  String phone = '0788123456';

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);

    print(
      'Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}'
    );

    totalFees += fee;
    i++;
  }

  print('Total fees: $totalFees RWF');
}

