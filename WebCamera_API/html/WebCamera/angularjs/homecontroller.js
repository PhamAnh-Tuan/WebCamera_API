

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

    $http.get(current_url + "admin/LoaiCamera/get-menu").then(function (response) {
        $scope.listmenu = response.data;
    }, function (error) {
        alert('failed');
    });
    var html = "";
    var dd = "---";
    $http.get(current_url + "admin/HangSanXuat/get-all").then(function (response) {
        var data = response.data;
        var data2 = $scope.listmenu;
        for (var i = 0; i < data.length; i++) {
            html += `<li class="link_container"><a href="">`;
            html += data[i].tenHang + `</a>`;
            childmenu(data2, data[i].maHang);
            html += "</li>";
        }

        $("#selectma").html(html)
        // console.log(html)

    }, function (error) {
        alert('failed');
    });

    function childmenu(data, j) {
        var idChildMenu = []; // reset sau mỗi lần lặp
        var nameChildMenu = []; // reset sau mỗi lần lặp
        for (var i = 0; i < data.length; i++) {
            if (data[i].parent_MaHang == j) {
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
            console.log($scope.loaicamera);
            $scope.sort = function (keyname) {
                $scope.sortKey = keyname;   //set the sortKey to the param passed
                $scope.reverse = !$scope.reverse; //if true make it false and vice versa
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
        }
    }, function (error) {
        alert('failed');
    });

    $http.get(current_url + "admin/LoaiCamera/get-menu").then(function (response) {
        $scope.listmenu = response.data;
    }, function (error) {
        alert('failed');
    });
    var html = "";
    var dd = "---";
    $http.get(current_url + "admin/HangSanXuat/get-all").then(function (response) {
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
            if (data[i].parent_MaHang == j) {
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
});
///
app.controller("chitietsanpham", function ($scope, $http, $location) {

    $http.get(current_url + "Home/get-detail/" + $location.search().MaCamera).then(function (d) {
        $scope.detail = d.data;
        console.log($scope.detail);
    }, function (error) {
        alert('failed');
    });
});
///
app.controller("RegisterController", function ($scope, $http) {
    $scope.Regis = function () {
        $http({
            method: 'POST',
            url: '/KhachHang/Register',
            data: $scope.regis
        }).then(function () {
            $scope.regis;
            window.history.back();
        })
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

    var users = localStorage.getItem("Client");
    var user = JSON.parse(users);
    $scope.makhach = user.maKhachHang;
    console.log($scope.makhach);

    var list = JSON.parse(localStorage.getItem('cart'));
    console.log(list);

    var listorder = "";
    var n = 0;
    var t = 0;
    list_json = [];
    var madon = 'DH' + localStorage.getItem('MaKH') + localStorage.getItem('maddh');
    for (x of list) {
        var item = {
            MaCamera: x.id,
            SoLuong: x.quantily
        }
        list_json.push(item);
    }

    $scope.checkOut = function () {

        var a = new Date();
        var b = a.getTime();
        localStorage.setItem('maddh', b);
        var currentdate = new Date();
        var datetime = currentdate.getMonth() + "/"
            + (currentdate.getDate()) + "/"
            + currentdate.getFullYear();
        var data1 = {
            "MaDonHang": madon,
            "listjson": list_json
        }
        console.log(data1);
        // 
        // $http({
        //     method: 'POST',
        //     url: '/ThanhToan/Add_DonHang',
        //     data: {
        //         MaDonHang: 'DH' + localStorage.getItem('MaKH') + localStorage.getItem('maddh'),
        //         MaKhachHang: localStorage.getItem('MaKH'),
        //         NgayTao: datetime,
        //         TrangThaiDonHang: 'Chưa xác nhận',
        //         TongTien: localStorage.getItem('tongtien'),
        //         TenKhachHang: $scope.thongtin.TenKhachHang,
        //         DiaChi: $scope.thongtin.SDT,
        //         SDT: $scope.thongtin.DiaChi,
        //         GhiChu: document.getElementById('comment').value,
        //         listjson: list_json
        //     }
        // }).then(function () {

        //     var sp = JSON.parse(localStorage.getItem('sp'));

        //     for (var i = 0; i < sp.length; i++) {
        //         $http({
        //             method: 'POST',
        //             url: '/ThanhToan/Add_ChiTietDonHang',
        //             data: {
        //                 MaDonHang: 'DH' + localStorage.getItem('MaKH') + localStorage.getItem('maddh'),
        //                 MaCauHinh: sp[i].MaCauHinh,
        //                 SoLuong: sp[i].SoLuong,
        //                 DonGia: sp[i].DonGia,
        //             }
        //         })
        //         //    .then(function (d) {
        //         //    $http.get('/Admin/GioHang/delete_GioHangByID?id=' + localStorage.getItem('ID')).then(function (d) {
        //         //    })
        //         //})
        //     }
        //     localStorage.removeItem('sp');
        //     alert('Chúc mừng bạn thanh toán thành công');
        //     window.location.href = '/Home/Index'
        // })
    };
});
///




