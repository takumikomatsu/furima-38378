
function calculation(){
  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  itemPrice.addEventListener('change', function(){
    const commission = itemPrice.value/10|0
    salesProfit = itemPrice.value-commission
    addTaxPrice.innerHTML = commission
    profit.innerHTML = salesProfit
  })
}
window.addEventListener('load', calculation)