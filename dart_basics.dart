### B2. Count Vowels

```dart
// Student: mustafa eliass abdulhalim adlan
// Reg no:  26501
const String regNo = '26501';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  text = text.toLowerCase();

  int count = 0;

  for (int i = 0; i < text.length; i++) {
    if ('aeiou'.contains(text[i])) {
      count++;
    }
  }

  return count;
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  String fullName = 'Mustafa Eliass Abdulhalim Adlan';

  print('$fullName has ${countVowels(fullName)} vowels');
}


