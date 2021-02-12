function price (){
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value
    const addTaxPrice = document.getElementById('add-tax-price')
    const profit = document.getElementById('profit')
    addTaxPrice.innerHTML = Math.floor(inputValue / 10).toLocaleString()
    profit.innerHTML = Math.floor(inputValue - (inputValue / 10 )).toLocaleString()
  })
}

window.addEventListener('load', price)