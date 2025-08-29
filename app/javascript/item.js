const price = () => {
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener("input", () => {
    const inputValue = Number(itemPrice.value);

    const commission = Math.floor(inputValue * 0.1);
    document.getElementById("add-tax-price").innerHTML = commission.toLocaleString();

    const profit = Math.floor(inputValue - commission);
    document.getElementById("profit").innerHTML = profit.toLocaleString();
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);