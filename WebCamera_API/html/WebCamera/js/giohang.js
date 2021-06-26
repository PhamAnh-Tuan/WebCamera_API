function addToCart(item) {
    var client = JSON.parse(localStorage.getItem('Client'));
    if (client == null) {
        document.getElementById("show-modal").style.display = "inline-block"
        // document.querySelector("#show-modal").hidden = false;
    }
    else {
        // debugger;    
        console.log(item.id);
        console.log($(item).parents().eq(2).find('.product-name').text());
        console.log($(item).parents().eq(2).find('.price-product55').val());
        console.log($(item).parents().eq(2).find('.img-responsive').attr('src'));


        var cartitem = {
            id: item.id,
            name: $(item).parents().eq(2).find('.product-name').text(),
            quantily: 1,
            image: $(item).parents().eq(2).find('.img-responsive').attr('src'),
            price: $(item).parents().eq(2).find('.price-product55').val()
        };
        console.log(cartitem);

        var listcart = [];
        if (localStorage.getItem('cart') == null) {
            listcart.push(cartitem);
            localStorage.setItem('cart', JSON.stringify(listcart));showSuccessToast();
        }
        else {
            listcart = JSON.parse(localStorage.getItem('cart'));

            let ok = true;
            for (let x of listcart) {
                if (x.id == item.id) {
                    x.quantily += 1;
                    showSuccessToast();
                    ok = false;
                    break;
                }
            }
            if (ok) {
                listcart.push(cartitem);
                showSuccessToast();
            }
        }
        localStorage.setItem('cart', JSON.stringify(listcart));
        console.log(listcart);
    }
}


var list = JSON.parse(localStorage.getItem('cart'));

function LoadData() {
    console.log(list);
    var str = "";
    var carthead = "";
    var listorder = "";
    var n = 0;
    var t = 0;
    for (x of list) {
        t += x.price * x.quantily;

        prices = Intl.NumberFormat().format(x.price);
        total_item = Intl.NumberFormat().format(x.price * x.quantily);
        total_all = Intl.NumberFormat().format(t);
        str += `<tr>
        <td class="cart_product"><a href="#"><img style="height:100px"
                    src="`+ x.image + `" alt="Sản phẩm"></a>
        </td>
        <td class="cart_description">
            <p class="product-name"><a href="#">`+ x.name + `
                </a></p><small class="cart_ref">Mã sản phẩm: 
            </small><br>
        </td>
        <td class="price"><span
                style="color: #e84d1c; font-size: 18px; font-weight: bold;">`+ prices + `
            </span></td>
        <td class="qty">
            <input class="form-control input-sm" type="text" readonly=""value="`+ x.quantily + `">
            <a class="plus" onclick="Tang(`+ x.id + `)">
                <i class="fa fa-caret-up"></i>
            </a>
            <a class="minus" onclick="Giam(`+ x.id + `)">
                <i class="fa fa-caret-down"></i>
            </a>
            
        </td>
        <td class="price"><span style="color: #e84d1c; font-size: 18px; font-weight: bold;">`+ total_item + `
            </span></td>
        <td class="action"><a class="remove_product"  onclick="Xoa(`+ x.id + `)">Xóa mục
            </a></td>
    </tr>`;
        carthead += `<li class="cart__item">
    <img src="`+ x.image + `"
        alt="" class="cart__item-img">
        <div>
    <div class="cart__item-info">
        <span style="text-overflow: ellipsis;white-space: nowrap;padding-right: 16px;">`+ x.name + `</span>
        <div style="font-size: 1.3rem;flex:1">2.000.000đ</div>
    </div></div>
    </li>`;
    }
    document.getElementById("cart__all").innerHTML = carthead;
    document.getElementById("cart-product").innerHTML = str;
    $("#total_num").text(total_all+' VNĐ');
    console.log(total_all);
}
function XoaCart() {
    localStorage.setItem('cart', null);
    location.reload();
}
function Xoa(id) {
    var index = list.findIndex(x => x.id == id);
    if (index >= 0) {
        list.splice(index, 1);
    }
    LoadData();
    localStorage.setItem('cart', JSON.stringify(list));
}
function updateCart() {
    localStorage.setItem('cart', JSON.stringify(list));
    alert("Đã cập nhật thông tin giở hàng thành công");
}
function Tang(id) {
    var index = list.findIndex(x => x.id == id);
    if (index >= 0) {
        list[index].quantily += 1;
        localStorage.setItem('cart', JSON.stringify(list));
    }
    LoadData();
}
function Giam(id) {
    var index = list.findIndex(x => x.id == id);
    if (index >= 0 && list[index].quantily >= 1) {
        list[index].quantily -= 1;
        localStorage.setItem('cart', JSON.stringify(list));
    }
    LoadData();
}
function updateQuantity(id) {
    var quantity = Number($('#q_' + id).val());
    var index = list.findIndex(x => x.id == id);
    if (index >= 0 && list[index].quantily >= 1) {
        list[index].quantily = quantily;
    }
    LoadData();
}
LoadData();