var list = JSON.parse(localStorage.getItem('cart'));
console.log(list);

var listorder = "";
var n = 0;
var t = 0;
list_json = [];
for (x of list) {

  t += x.price * x.quantily;

  prices = Intl.NumberFormat().format(x.price);
  total_item = Intl.NumberFormat().format(x.price * x.quantily);
  total_all = Intl.NumberFormat().format(t);
  listorder += `<tr>
    <td><img style="height:100px"
    src="`+ x.image + `" alt="Sản phẩm">
    </td>
    <td>`+ x.name + `</td>
    <td>`+ prices + `</td>
    <td>`+ x.quantily + `</td>
    <td>`+ total_item + `</td>
    </tr>`;
}

document.getElementById("list-order").innerHTML = listorder;
$("#total_price").text(total_all);


