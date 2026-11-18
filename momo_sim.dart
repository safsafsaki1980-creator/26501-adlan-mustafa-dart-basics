
// Student: mustafa eliass abdulhalim adlan
// Reg no:  26501
const String regNo = '26501';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// PART D2: MoMo fees
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

// Run the Part D2 receipt program
void runD2Receipts() {
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

// PART F: Format money
String formatRwf(int amount) {
  String digits = amount.abs().toString();
  String result = '';
  int i = 0;

  while (i < digits.length) {
    result += digits[i];

    int remaining = digits.length - i - 1;
    if (remaining > 0 && remaining % 3 == 0) {
      result += ',';
    }

    i++;
  }

  if (amount < 0) {
    result = '-$result';
  }

  return '$result RWF';
}

// Check PIN
bool isValidPin(String pin) {
  if (pin.length != 5 || pin == '12345') {
    return false;
  }

  int i = 0;
  bool allSame = true;

  while (i < pin.length) {
    int code = pin.codeUnitAt(i);

    if (code < 48 || code > 57) {
      return false;
    }

    if (pin[i] != pin[0]) {
      allSame = false;
    }

    i++;
  }

  return !allSame;
}

// Send money
int sendMoney(int balance, int amount) {
  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount - fee;

  print(
    'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
    'New balance: ${formatRwf(newBalance)}'
  );

  return newBalance;
}

// Buy airtime
int buyAirtime(int balance, int amount) {
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;

  print(
    'Airtime bought: ${formatRwf(amount)}. '
    'New balance: ${formatRwf(newBalance)}'
  );

  return newBalance;
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  // Part D2
  runD2Receipts();

  // Part F: PIN tests
  print(isValidPin('12345'));
  print(isValidPin('77777'));
  print(isValidPin('4821'));
  print(isValidPin('48a21'));
  print(isValidPin('4821$d'));

  // Part F: Transactions
  int balance = 20000 + t * 500;

  print('Starting balance: ${formatRwf(balance)}');

  int i = 0;
  while (i < 3) {
    balance = sendMoney(balance, (d + 1) * 3000);
    i++;
  }

  balance = buyAirtime(balance, 1000);

  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  print('Final balance: ${formatRwf(balance)}');

  // Part F: Additional tests (expected output in comments)
  print(formatRwf(0));        // 0 RWF
  print(formatRwf(999));      // 999 RWF
  print(formatRwf(1000));     // 1,000 RWF
  print(formatRwf(1250000));  // 1,250,000 RWF
  print(formatRwf(-5000));    // -5,000 RWF

  print(isValidPin('48219')); // true
  print(isValidPin('00000')); // false

