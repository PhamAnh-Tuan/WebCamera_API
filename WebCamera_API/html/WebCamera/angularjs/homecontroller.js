

var app = angular.module('Homeapp', ['ui.bootstrap']);
/*======================================================================================================================================*/
app.controller("HomeClient", function ($rootScope, $scope, $http) {
    $http.get(current_url + 'Home/get-all').then(function (d) {
        $scope.listsp = d.data;
    }, function (error) {
        alert('failed');
    });
    $http.get(current_url + 'Home/get-camera-hot').then(function (d) {
        $scope.sphot = d.data;
    }, function (error) {
        alert('failed');
    });

    $http.get(current_url + "Home/get-menu").then(function (response) {
        $scope.listmenu = response.data;
    }, function (error) {
        alert('failed');
    });
    var html = "";
    var dd = "---";
    $http.get(current_url + "Home/gethang-all").then(function (response) {
        var data = response.data;
        var data2 = $scope.listmenu;
        for (var i = 0; i < data.length; i++) {
            html += `<li class="link_container"><a href="">`;
            html += data[i].tenHang + `</a>`;
            childmenu(data2, data[i].maHang);
            html += "</li>";
        }

        $("#selectma").html(html);

    }, function (error) {
        alert('failed');
    });

    function childmenu(data, j) {
        var idChildMenu = []; // reset sau mỗi lần lặp
        var nameChildMenu = []; // reset sau mỗi lần lặp
        for (var i = 0; i < data.length; i++) {
            if (data[i].maHang == j) {
                idChildMenu.push(data[i].maLoai);
                nameChildMenu.push(data[i].tenLoai);
            }
        }

        if (idChildMenu.length > 0) {
            if (idChildMenu.length > 0) {
                html += `<ul class="block" style="padding-left: 15px;">`;
                for (var k = 0; k < idChildMenu.length; k++) {
                    var a = idChildMenu[k];
                    html += `<li class="link_container"><a href="loaicamera.html#!?MaLoai=` + idChildMenu[k] + `">`;
                    html += nameChildMenu[k];
                    html += "</a></li>";
                }
                html += `</ul>`;
            }
        }
        else {
            dd = "";
        }
    }
    $scope.login = function () {
        $http({
            method: "POST",
            data: {
                "Email": $scope.email,
                "MatKhau": $scope.pass
            },
            url: current_url + 'KhachHang/login'
        }).then(function (d) {
            if (d.data.maKhachHang != null) {
                myStr = JSON.stringify(d.data);
                localStorage.setItem('Client', myStr);
                window.location.href = 'index.html';
            }
            else {
                alert('Đăng nhập thất bại');
            }
        }).error(function () {
            alert('Đăng nhập thất bại');
        })
    }
    $scope.register = function () {
        var data = {
            "TenKhachHang": $scope.fullname,
            "Email": $scope.email,
            "MatKhau": $scope.pass,
            "GioiTinh": $scope.gioitinh,
            "SDT": $scope.phone,
            "DiaChi": $scope.address
        }
        console.log(data);
        if ($scope.fullname == null || $scope.email == null || $scope.pass == null || $scope.gioitinh == null || $scope.phone == null || $scope.address == null) {
            alert("Vui lòng nhập đầy đủ thông tin");
        }
        else {
            $http({
                method: "POST",
                data: {
                    "TenKhachHang": $scope.fullname,
                    "Email": $scope.email,
                    "MatKhau": $scope.pass,
                    "GioiTinh": ~~$scope.gioitinh,
                    "SDT": $scope.phone,
                    "DiaChi": $scope.address
                },
                url: current_url + 'KhachHang/register'
            }).then(function () {
                $('#myModal').hide();
                $('.modal-backdrop').hide();
                showRegistration();
            }).error(function () {
                alert('Đăng ký thất bại');
            })
        }
    }
    $scope.log = true;
    if (localStorage.getItem("Client") != null) {
        $scope.log = false;
        $scope.tk = true;
        var users = localStorage.getItem("Client");
        var user = JSON.parse(users);
        $scope.taikhoan = user.tenKhachHang;
        console.log($scope.taikhoan);
    }


});

app.controller("LoaisanphamController", function ($scope, $http, $location) {

    $http.get(current_url + "LoaiCamera/get-sp-maloai/" + $location.search().MaLoai).then(function (d) {
        if (d.data != null) {
            $scope.loaicamera = d.data;
            $scope.Sort = function () {
                key = $scope.keyname;
                $scope.sortKey = key;
                $scope.reverse = !$scope.reverse; 
            }
            $scope.viewby = 8;
            $scope.totalItems = $scope.loaicamera.length;
            $scope.currentPage = 1;
            $scope.itemsPerPage = $scope.viewby;
            $scope.maxSize = 5;

            $scope.setPage = function (pageNo) {
                $scope.currentPage = pageNo;
            };

            $scope.setItemsPerPage = function (num) {
                $scope.itemsPerPage = num;
                $scope.currentPage = 1;
            }
            $scope.switchPerPage = function () {
                number = $scope.selected;

                $scope.itemsPerPage = number;
                $scope.currentPage = 1;
            }
        }
    }, function (error) {
        alert('failed');
    });

    $http.get(current_url + "Home/get-menu").then(function (response) {
        $scope.listmenu = response.data;
    }, function (error) {
        alert('failed');
    });
    var html = "";
    var dd = "---";
    $http.get(current_url + "Home/gethang-all").then(function (response) {
        var data = response.data;
        var data2 = $scope.listmenu;
        for (var i = 0; i < data.length; i++) {
            html += `<li class="link_container"><a href="">`;
            html += data[i].tenHang + `</a>`;
            childmenu(data2, data[i].maHang);
            html += "</li>";
        }

        $("#selectma").html(html)
        console.log(html)

    }, function (error) {
        alert('failed');
    });

    function childmenu(data, j) {
        var idChildMenu = []; // reset sau mỗi lần lặp
        var nameChildMenu = []; // reset sau mỗi lần lặp
        for (var i = 0; i < data.length; i++) {
            if (data[i].maHang == j) {
                idChildMenu.push(data[i].maLoai);
                nameChildMenu.push(data[i].tenLoai);
            }
        }

        if (idChildMenu.length > 0) {
            if (idChildMenu.length > 0) {
                html += `<ul class="block" style="padding-left: 15px;">`;
                for (var k = 0; k < idChildMenu.length; k++) {
                    var a = idChildMenu[k];
                    html += `<li class="link_container"><a href="loaicamera.html#!?MaLoai=` + idChildMenu[k] + `">`;
                    html += nameChildMenu[k];
                    html += "</a></li>";
                }
                html += `</ul>`;
            }
        }
        else {
            dd = "";
        }
    }

    $scope.log = true;
    if (localStorage.getItem("Client") != null) {
        $scope.log = false;
        $scope.tk = true;
        var users = localStorage.getItem("Client");
        var user = JSON.parse(users);
        $scope.taikhoan = user.tenKhachHang;
        console.log($scope.taikhoan);
    }
});
///
app.controller("SettingController", function ($scope, $http) {
    $scope.log = true;
    if (localStorage.getItem("TaiKhoan") != null) {
        $scope.log = false;
        $scope.tk = true;
        $scope.taikhoan = localStorage.getItem("TaiKhoan")

    }
    $http.get('/KhachHang/Get_Info?TK=' + localStorage.getItem('TaiKhoan')).then(function (d) {
        localStorage.setItem('MaKH', d.data.MaKhachHang);
    }, function (error) {
        alert('failed');
    })
    $http.get('/GioHang/Get_Cart?MaKhach=' + localStorage.getItem('MaKH')).then(function (d) {
        $scope.datacar = d.data;
        var c = 0;
        for (var i = 0; i < d.data.length; i++) {
            c = c + 1;
        }
        $scope.coun = c;
    }, function (error) {
        alert('failed');
    })
})
///
app.controller("SearchController", function ($scope, $http) {
    $scope.name = '';
    $scope.changevalue = function () {
        $scope.name1 = document.getElementById("name").value;
        $scope.name = $scope.name1.replaceAll(' ', '_');
        console.log($scope.name1)
        console.log($scope.name)
        return $scope.name;
    }
});
///
app.controller("Search", function ($scope, $http, $location) {
    $http.get(current_url + "Home/search/" + $location.search().KeyWord).then(function (d) {
        $scope.listsearch = d.data;
        $scope.sort = function (keyname) {
            $scope.sortKey = keyname;
            $scope.reverse = !$scope.reverse;
        }
        $scope.viewby = 8;
        $scope.totalItems = $scope.listsearch.length;
        $scope.currentPage = 1;
        $scope.itemsPerPage = $scope.viewby;
        $scope.maxSize = 5;

        console.log($scope.listsearch);
        $scope.setPage = function (pageNo) {
            $scope.currentPage = pageNo;
        };

        $scope.setItemsPerPage = function (num) {
            $scope.itemsPerPage = num;
            $scope.currentPage = 1;
        }
    }, function (error) {
        alert('Failed');
    });
    $scope.log = true;
    if (localStorage.getItem("Client") != null) {
        $scope.log = false;
        $scope.tk = true;
        var users = localStorage.getItem("Client");
        var user = JSON.parse(users);
        $scope.taikhoan = user.tenKhachHang;
        console.log($scope.taikhoan);
    }
});
///
app.controller("chitietsanpham", function ($scope, $http, $location) {

    $http.get(current_url + "Home/get-detail/" + $location.search().MaCamera).then(function (d) {
        $scope.detail = d.data;
        console.log($scope.detail);
    }, function (error) {
        alert('failed');
    });
    $scope.log = true;
    if (localStorage.getItem("Client") != null) {
        $scope.log = false;
        $scope.tk = true;
        var users = localStorage.getItem("Client");
        var user = JSON.parse(users);
        $scope.taikhoan = user.tenKhachHang;
        console.log($scope.taikhoan);
    }
});

///
app.controller("GioHangController", function ($scope, $http) {
    var users = localStorage.getItem("Client");
    var user = JSON.parse(users);
    $scope.makhach = user.maKhachHang;

    $scope.log = true;
    if (localStorage.getItem("Client") != null) {
        $scope.log = false;
        $scope.tk = true;
        var users = localStorage.getItem("Client");
        var user = JSON.parse(users);
        $scope.taikhoan = user.tenKhachHang;
        console.log($scope.taikhoan);

    }
});
///
app.controller("PayController", function ($scope, $http, $rootScope) {
    $scope.log = true;
    if (localStorage.getItem("Client") != null) {
        $scope.log = false;
        $scope.tk = true;
        var users = localStorage.getItem("Client");
        var user = JSON.parse(users);
        $scope.taikhoan = user.tenKhachHang;
        console.log($scope.taikhoan);
    }


    var users = localStorage.getItem("Client");
    var us = JSON.parse(users);
    $scope.user = us;
    console.log($scope.user);

    var list = JSON.parse(localStorage.getItem('cart'));
    var t = 0;

    // 
    list_json = [];
    var madon = 'DH' + $scope.user.maKhachHang + Math.floor(Math.random() * 10000000);
    console.log(madon);
    for (x of list) {
        var item = {
            MaDonHang: madon,
            MaCamera: x.id,
            SoLuong: x.quantily,
            DonGia: x.price
        }
        list_json.push(item);
    }
    console.log(list_json);
    $scope.checkOut = function () {
        $.each(list, function (key, value) {
            t += value.price * value.quantily;
        });
        // var a = new Date();
        // var b = a.getTime();
        var currentdate = new Date();
        var datetime = currentdate.getMonth() + 1 + "/"
            + (currentdate.getDate()) + "/"
            + currentdate.getFullYear()
        // 
        $http({
            method: 'POST',
            url: current_url + 'DonHang/create-donhang',
            data: {
                MaDonHang: madon,
                MaKhachHang: $scope.user.maKhachHang,
                NgayTao: datetime,
                TrangThaiDonHang: 'Chưa xác thực',
                TrangThaiVanChuyen: 'Chưa vận chuyển',
                TrangThaiThanhToan: 'Chưa thanh toán',
                TongTien: t,
                TenKhachHang: $scope.user.tenKhachHang,
                DiaChi: $scope.user.diaChi,
                SDT: $scope.user.sdt,
                GhiChu: document.getElementById('delivery-payment-method').value
            }
        }).then(function (trus) {     
            $.each(list, function (key, value) {
                $http({
                    method: 'POST',
                    url: current_url + 'DonHang/create-chitiet',
                    data: {
                        MaDonHang: madon,
                        MaCamera: ~~value.id,
                        SoLuong: value.quantily,
                        DonGia: ~~value.price
                    }
                });
            })
        }).then(function (d) { 
            localStorage.removeItem('cart');
            alert('Chúc mừng bạn thanh toán thành công');
            window.location.href = 'index.html';
        })
    };
});




