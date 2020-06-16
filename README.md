# ByteCoin

## Goal
1. https://www.coinapi.io/ >> API 이용
2. ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"] 각 국가의 통화
3. PickerView를 이용해 특정 국가의 통화를 선택하면 1비트코인에 해당하는 해당 통화의 금액 표시

### Picker View Delegate
```
// 하나의 PickerView안에 몇 개의 선택 가능한 리스트를 표시할지 결정
func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
}

// PickerView에 표시될 항목의 개수를 반환하는 메소드
func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

}

// PickerView 내에서 특정한 위치(row)를 가리키게 될 때, 그 위치에 해당하는 문자열 반환
func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

}

// PickerView에서 특정 row가 선택될 때 어떤 행동을 할지 정의하는 메소드
func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

}
```

## 실행 화면
[![play](http://img.youtube.com/vi/lqvZHHgS6eI/0.jpg)](https://www.youtube.com/watch?v=lqvZHHgS6eI?t=0s)

