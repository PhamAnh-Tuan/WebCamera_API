var _user = JSON.parse(localStorage.getItem("user"));
var app = angular.module('myApp', ['ui.bootstrap']);
app.controller('myCtrl', function ($scope, $http) {
        $scope.maxsize = 5;

        $scope.totalcount = 0;

        $scope.pageIndex = 1;

        $scope.pageSize = 5;

        $scope.searchText = '';
        //----------------------------------------------------------------------------------------------------------------
        $scope.HangSXLisst = function () {
                $http({
                        method: 'GET',
                        headers: {
                                "Authorization": 'Bearer ' + _user.token
                        },
                        url: current_url + "HangSanXuat/get-hang/" + $scope.pageIndex + "/" + $scope.pageSize
                }).then(function (response) {
                        $scope.listhang = response.data.listHang;
                        $scope.totalcount = response.data.totalcount;

                }, function (e) {
                        alert('Có lỗi xảy ra');
                });
        }
        $scope.HangSXLisst();
        $scope.pagechanged = function () {
                $scope.HangSXLisst();

        }
        $scope.changePageSize = function () {
                $scope.pageIndex = 1;
                $scope.HangSXLisst();
        }
        // xóa hãng
        $scope.delete = function (id) {
                $http({
                        method: 'GET',
                        headers: {
                                "Authorization": 'Bearer ' + _user.token
                        },
                        url: current_url + "HangSanXuat/delete-hang/" + id
                }).then(function (response) {
                        alert('xóa thành công');
                        $scope.HangSXLisst();
                }, function (e) {
                        alert('Có lỗi xảy ra');
                });

        };
        // thêm hãng
        $scope.save = function () {
                $http({
                        method: 'POST',
                        headers: {
                                "Authorization": 'Bearer ' + _user.token
                        },
                        data: $scope.hsx,
                        url: current_url + 'HangSanXuat/create-hang'
                }).then(function (d) {
                        alert("Thêm thành công");
                        window.location.href = 'hangsanxuat-index.html';

                }, function (e) {
                        console.log('Thêm thất bại');
                });
        }
});
app.controller('edit', function ($scope, $http, $location) {
        $http({
                method: 'GET',
                headers: {
                        "Authorization": 'Bearer ' + _user.token
                },
                url: current_url + "HangSanXuat/get-byid-hang/" + $location.search().MaHang
        }).then(function (d) {
                $scope.hangsx = d.data;
                console.log($scope.hangsx);
                $("#MaHang1").val(d.data.maHang);
                $("#TenHang1").val(d.data.tenHang);
                $("#ThongTin1").val(d.data.thongTin);

        }, function (e) {
                alert('Có lỗi xảy ra');
        });
        $scope.update = function () {
                var object1 = {
                        "MaHang": ~~$("#MaHang1").val(),
                        "TenHang": $("#TenHang1").val(),
                        "ThongTin": $("#ThongTin1").val()
                }
                console.log(object1);
                $http({
                        method: 'POST',
                        headers: {
                                "Authorization": 'Bearer ' + _user.token
                        },
                        url: current_url + 'HangSanXuat/update-hang',
                        data: object1
                }).then(function (d) {
                        alert("Cập nhật thành công");
                        window.location.href = 'hangsanxuat-index.html'
                }, function (e) {
                        console.log(e);
                });

        }
});
//
app.controller('loaicamera', function ($scope, $http) {
        $scope.maxsize = 5;

        $scope.totalcount = 0;

        $scope.pageIndex = 1;

        $scope.pageSize = 5;

        $scope.searchText = '';
        $scope.LoaiLisst = function () {
                $http({
                        method: 'GET',
                        headers: {
                                "Authorization": 'Bearer ' + _user.token
                        },
                        url: current_url + "LoaiCamera/get-loai/" + $scope.pageIndex + "/" + $scope.pageSize
                }).then(function (response) {
                        $scope.listLoai = response.data.listLoai;
                        $scope.totalcount = response.data.totalcount;

                }, function (e) {
                        alert('Có lỗi xảy ra');
                });
        }
        $scope.LoaiLisst();
        $scope.pagechangeds = function () {

                $scope.LoaiLisst();

        }
        $scope.changePageSizes = function () {
                $scope.pageIndex = 1;
                $scope.LoaiLisst();
        }

        $scope.delete = function (id) {
                $http({
                        method: 'GET',
                        headers: {
                                "Authorization": 'Bearer ' + _user.token
                        },
                        url: current_url + "LoaiCamera/delete-loai/" + id
                }).then(function (response) {
                        alert('xóa thành công');
                        $http({
                                method: 'GET',
                                headers: {
                                        "Authorization": 'Bearer ' + _user.token
                                },
                                url: current_url + "LoaiCamera/get-loai/" + $scope.pageIndex + "/" + $scope.pageSize
                        }).then(function (response) {
                                $scope.listLoai = response.data.listLoai;
                                $scope.totalcount = response.data.totalcount;
                        }, function (e) {
                                alert('Có lỗi xảy ra');
                        });
                }, function (e) {
                        alert('Có lỗi xảy ra');
                });

        };

        $scope.save = function () {

                var formdata = {
                        "MaHang": ~~$scope.MaHang,
                        "TenLoai": $scope.TenLoai,
                        "MoTa": $scope.MoTa,
                }
                console.log(formdata)

                $http({
                        method: 'POST',
                        headers: {
                                "Authorization": 'Bearer ' + _user.token
                        },
                        url: current_url + 'LoaiCamera/create-loai',
                        data: formdata
                }).then(function (d) {
                        alert("Thêm thành công");
                        // showTitle('Thêm thành công');
                        window.location.href = 'loai-index.html';

                }, function (e) {
                        console.log('Thêm thất bại');
                });

        }
        //

        $http({
                method: 'GET',
                headers: {
                        "Authorization": 'Bearer ' + _user.token
                },
                url: current_url + "HangSanXuat/get-all"
        }).then(function (response) {
                $scope.listhang = response.data;
        }, function (e) {
                alert('Có lỗi xảy ra');
        });

});
app.controller('edit-loai', function ($scope, $http, $location) {
        $http({
                method: 'GET',
                headers: {
                        "Authorization": 'Bearer ' + _user.token
                },
                url: current_url + "LoaiCamera/get-byid-loai/" + $location.search().MaLoai
        }).then(function (response) {
                $scope.loai = response.data;
        }, function (e) {
                alert('Có lỗi xảy ra');
        });

        $http({
                method: 'GET',
                headers: {
                        "Authorization": 'Bearer ' + _user.token
                },
                url: current_url + "HangSanXuat/get-all"
        }).then(function (response) {
                $scope.listhang = response.data;
        }, function (e) {
                alert('Có lỗi xảy ra');
        });

        $scope.update = function () {
                $http({
                        method: 'POST',
                        headers: {
                                "Authorization": 'Bearer ' + _user.token
                        },
                        url: current_url + 'LoaiCamera/update-loai',
                        data: {
                                MaLoai: ~~$scope.loai.maLoai,
                                MaHang: ~~$scope.loai.maHang,
                                TenLoai: $scope.loai.tenLoai,
                                MoTa: $scope.loai.moTa
                        }
                }).then(function (d) {
                        alert("Cập nhật thành công");
                        window.location.href = 'loai-index.html'
                }, function (e) {
                        console.log('Cập nhật thất bại');
                });

        }
});
//
app.controller('camera', function ($scope, $http, $location) {
        $scope.maxsize = 5;

        $scope.totalcount = 0;

        $scope.pageIndex = 1;

        $scope.pageSize = 5;

        $scope.searchText = '';
        $scope.CameraList = function () {
                $http({
                        method: 'GET',
                        headers: {
                                "Authorization": 'Bearer ' + _user.token
                        },
                        url: current_url + "Camera/get-camera/" + $scope.pageIndex + "/" + $scope.pageSize
                }).then(function (response) {
                        $scope.listCamera = response.data.listCamera;
                        $scope.totalcount = response.data.totalcount;
                }, function (e) {
                        alert('Có lỗi xảy ra');
                });
        }
        $scope.CameraList();
        $scope.pagechangeds = function () {

                $scope.CameraList();

        }
        $scope.changePageSizes = function () {
                $scope.pageIndex = 1;
                $scope.CameraList();
        }

        $scope.delete = function (id) {
                $http({
                        method: 'GET',
                        headers: {
                                "Authorization": 'Bearer ' + _user.token
                        },
                        url: current_url + "Camera/delete-camera/" + id
                }).then(function (response) {
                        alert('xóa thành công');
                        $http({
                                method: 'GET',
                                headers: {
                                        "Authorization": 'Bearer ' + _user.token
                                },
                                url: current_url + "Camera/get-camera/" + $scope.pageIndex + "/" + $scope.pageSize
                        }).then(function (response) {
                                $scope.listCamera = response.data.listCamera;
                                $scope.totalcount = response.data.totalcount;

                        }, function (e) {
                                alert('Có lỗi xảy ra');
                        });
                }, function (e) {
                        alert('Có lỗi xảy ra');
                });
        };
        $scope.updatehot = function (id) {
                $http({
                        method: 'POST',
                        headers: {
                                "Authorization": 'Bearer ' + _user.token
                        },
                        url: current_url + 'Camera/update-hot/' + id
                }).then(function (response) {
                        alert('Cập nhật hot thành công..');
                        window.location.href = 'sanpham-index.html';
                }, function () {
                        alert('Cập nhật thất bại');
                });

        };
        //
        $http({
                method: 'GET',
                headers: {
                        "Authorization": 'Bearer ' + _user.token
                },
                url: current_url + "LoaiCamera/get-menu"
        }).then(function (response) {
                $scope.listmenu = response.data;
                $scope.listmenuHang = removeDumplicateValue(response.data);
        }, function (e) {
                alert('Có lỗi xảy ra');
        });


        var html = "";
        var dd = "|---";
        $http({
                method: 'GET',
                headers: {
                        "Authorization": 'Bearer ' + _user.token
                },
                url: current_url + "HangSanXuat/get-all"
        }).then(function (response) {
                var data = response.data;

                var data2 = $scope.listmenu;
                html += `<select id="MaLoai">`;
                for (var i = 0; i < data.length; i++) {
                        html += "<option>";
                        html += data[i].tenHang;
                        html += "</option>";
                        childmenu(data2, data[i].maHang);
                }
                html += "</select>";

                $("#selectma").html(html)
                console.log(html)
        }, function (e) {
                alert('Có lỗi xảy ra');
        });


        function childmenu(data, j) {
                var idChildMenu = [];
                var nameChildMenu = [];
                for (var i = 0; i < data.length; i++) {
                        if (data[i].maHang == j) {
                                idChildMenu.push(data[i].maLoai);
                                nameChildMenu.push(data[i].tenLoai);
                        }
                }

                if (idChildMenu.length > 0) {
                        if (idChildMenu.length > 0) {
                                for (var k = 0; k < idChildMenu.length; k++) {
                                        var a = idChildMenu[k];
                                        html += `<option value="${a}">`;
                                        html += dd;
                                        html += nameChildMenu[k];
                                        html += "</option>";
                                }
                        }
                }
                else {
                        dd = "";
                }
        }

        $scope.save = function () {
                var file = document.getElementById('file-img').files[0];
                if (file) {
                        const formData = new FormData();
                        formData.append('file', file);
                        $http({
                                method: 'POST',
                                headers: {
                                        "Authorization": 'Bearer ' + _user.token,
                                        'Content-Type': undefined
                                },
                                data: formData,
                                url: current_url + 'Camera/upload',
                        }).then(function (res) {
                                $http({
                                        method: 'POST',
                                        headers: { "Authorization": 'Bearer ' + _user.token },
                                        data: {
                                                "TenCamera": $scope.TenCamera,
                                                "MaLoai": ~~$("#MaLoai").val(),
                                                "DoPhanGiai": $scope.DoPhanGiai,
                                                "Chip": $scope.Chip,
                                                "OngKinh": $scope.OngKinh,
                                                "TamQuanSat": $scope.TamQuanSat,
                                                "NguonDien": $scope.NguonDien,
                                                "HinhAnh": $('#file-img')[0].files[0].name,
                                                "Gia": ~~$scope.Gia,
                                                "CameraHot": ~~$scope.CameraHot
                                        },
                                        url: current_url + 'Camera/create-camera',
                                }).then(function (response) {
                                        alert('Thêm sản phẩm thành công');
                                        window.location.href = 'sanpham-index.html';
                                });
                        });
                } else {
                        $http({
                                method: 'POST',
                                headers: { "Authorization": 'Bearer ' + _user.token },
                                data: {
                                        "TenCamera": $scope.TenCamera,
                                        "MaLoai": ~~$("#MaLoai").val(),
                                        "DoPhanGiai": $scope.DoPhanGiai,
                                        "Chip": $scope.Chip,
                                        "OngKinh": $scope.OngKinh,
                                        "TamQuanSat": $scope.TamQuanSat,
                                        "NguonDien": $scope.NguonDien,
                                        "HinhAnh": '',
                                        "Gia": ~~$scope.Gia,
                                        "CameraHot": ~~$scope.CameraHot
                                },
                                url: current_url + 'Camera/create-camera',
                        }).then(function (response) {
                                alert('Thêm sản phẩm thành công');
                                window.location.href = 'sanpham-index.html';
                        });
                }

        };
});
app.controller('edit-camera', function ($scope, $http, $location) {
        $http({
                method: 'GET',
                headers: {
                        "Authorization": 'Bearer ' + _user.token
                },
                url: current_url + "Camera/get-byid-camera/" + $location.search().MaCamera
        }).then(function (response) {
                $scope.camera = response.data;
                console.log($scope.camera);
        }, function (e) {
                alert('Có lỗi xảy ra');
        });

        $http({
                method: 'GET',
                headers: {
                        "Authorization": 'Bearer ' + _user.token
                },
                url: current_url + "LoaiCamera/get-menu"
        }).then(function (response) {
                $scope.listmenu = response.data;
                $scope.listmenuHang = removeDumplicateValue(response.data);
        }, function (e) {
                alert('Có lỗi xảy ra');
        });

        var html = "";
        var dd = "---";

        $http({
                method: 'GET',
                headers: {
                        "Authorization": 'Bearer ' + _user.token
                },
                url: current_url + "HangSanXuat/get-all"
        }).then(function (response) {
                var data = response.data;
                // 
                var data2 = $scope.listmenu;
                var ml = $scope.camera.maLoai;
                html += `<select id="MaLoai" class="form-control ng-pristine ng-valid ng-not-empty ng-touched"><option value="${ml}" selected>` + $scope.camera.tenLoai + `</option>`;
                for (var i = 0; i < data.length; i++) {
                        html += "<option>";
                        html += data[i].tenHang;
                        html += "</option>";
                        childmenu(data2, data[i].maHang);
                }
                html += "</select>";

                $("#selectma").html(html)
                console.log(html)
        }, function (e) {
                alert('Có lỗi xảy ra');
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
                                for (var k = 0; k < idChildMenu.length; k++) {
                                        var a = idChildMenu[k];
                                        html += `<option value="${a}">`;
                                        html += dd;
                                        html += nameChildMenu[k];
                                        html += "</option>";

                                }

                        }
                }
                else {
                        dd = "";
                }
        }

        $scope.update = function () {
                var images = document.getElementById("profile-img");
                var image = images.currentSrc.split("/");
                for (var i = 0; i < image.length; i++) {
                        images_names = image[image.length - 1];
                }

                var file = document.getElementById('file-img').files[0];
                if (file) {
                        const formData = new FormData();
                        formData.append('file', file);
                        $http({
                                method: 'POST',
                                headers: {
                                        "Authorization": 'Bearer ' + _user.token,
                                        'Content-Type': undefined
                                },
                                data: formData,
                                url: current_url + 'Camera/upload',
                        }).then(function (res) {
                                $http({
                                        method: 'POST',
                                        headers: { "Authorization": 'Bearer ' + _user.token },
                                        data: {
                                                "MaCamera": ~~$scope.camera.maCamera,
                                                "TenCamera": $scope.camera.tenCamera,
                                                "MaLoai": ~~$("#MaLoai").val(),
                                                "DoPhanGiai": $scope.camera.doPhanGiai,
                                                "Chip": $scope.camera.chip,
                                                "OngKinh": $scope.camera.ongKinh,
                                                "TamQuanSat": $scope.camera.tamQuanSat,
                                                "NguonDien": $scope.camera.nguonDien,
                                                "HinhAnh": $('#file-img')[0].files[0].name,
                                                "Gia": ~~$scope.camera.gia
                                        },
                                        url: current_url + 'Camera/update-camera',
                                }).then(function (response) {
                                        alert('Cập nhật sản phẩm thành công');
                                        window.location.href = 'sanpham-index.html';
                                });
                        });
                } else {
                        $http({
                                method: 'POST',
                                headers: { "Authorization": 'Bearer ' + _user.token },
                                data: {
                                        "MaCamera": ~~$scope.camera.maCamera,
                                        "TenCamera": $scope.camera.tenCamera,
                                        "MaLoai": ~~$("#MaLoai").val(),
                                        "DoPhanGiai": $scope.camera.doPhanGiai,
                                        "Chip": $scope.camera.chip,
                                        "OngKinh": $scope.camera.ongKinh,
                                        "TamQuanSat": $scope.camera.tamQuanSat,
                                        "NguonDien": $scope.camera.nguonDien,
                                        "HinhAnh": images_names,
                                        "Gia": ~~$scope.camera.gia
                                },
                                url: current_url + 'Camera/update-camera',
                        }).then(function (response) {
                                alert('Cập nhật sản phẩm thành công');
                                window.location.href = 'sanpham-index.html';
                        });
                }
        }
});
//
app.controller('nhacungcap', function ($scope, $http, $location) {
        $scope.maxsize = 5;

        $scope.totalcount = 0;

        $scope.pageIndex = 1;

        $scope.pageSize = 5;

        $scope.searchText = '';
        //----------------------------------------------------------------------------------------------------------------
        $scope.NCCList = function () {
                $http.get(current_url + "NhaCungCap/get-ncc/" + $scope.pageIndex + "/" + $scope.pageSize).then(function (response) {
                        $scope.listncc = response.data.listNCC;
                        $scope.totalcount = response.data.totalcount;
                        console.log(listncc);

                }, function (error) {
                        alert('Có lỗi xảy ra');
                });
        }
        $scope.NCCList();
        $scope.pagechanged = function () {
                $scope.NCCList();

        }
        $scope.changePageSize = function () {
                $scope.pageIndex = 1;
                $scope.NCCList();
        }
        //
        $scope.delete = function (id) {
                $http.get(current_url + "NhaCungCap/delete-ncc/" + id).then(function (d) {
                        alert('xóa thành công');
                        $http.get(current_url + "NhaCungCap/get-ncc/" + $scope.pageIndex + "/" + $scope.pageSize).then(function (response) {
                                $scope.listncc = response.data.listNCC;
                                $scope.totalcount = response.data.totalcount;
                                console.log(listncc);
                        }, function (error) {
                                alert('Có lỗi xảy ra');
                        });
                }, function (error) {
                        alert('Có lỗi xảy ra');
                });

        };
        // 
        $scope.save = function () {
                $http({
                        method: 'POST',
                        data: $scope.ncc,
                        url: current_url + 'NhaCungCap/create-ncc'
                }).then(function (d) {
                        alert("Thêm thành công");
                        window.location.href = 'nhacungcap-index.html'
                }, function (e) {
                        console.log(e);
                });
        }
});
app.controller('edit-nhacungcap', function ($scope, $http, $location) {
        $http.get(current_url + "NhaCungCap/get-byid-ncc/" + $location.search().mancc).then(function (d) {
                $scope.ncc = d.data;
                console.log($scope.ncc);
        }, function (error) {
                alert('Có lỗi xảy ra');
        });

        $scope.update = function () {
                $http({
                        method: 'POST',
                        url: current_url + 'NhaCungCap/update-ncc',
                        data: {
                                "MaNCC": ~~$scope.ncc.maNCC,
                                "TenNCC": $scope.ncc.tenNCC,
                                "DiaChi": $scope.ncc.diaChi,
                                "SDT": $scope.ncc.sdt,
                                "Email": $scope.ncc.email
                        }
                }).then(function (d) {
                        alert("Cập nhật thành công");
                        window.location.href = 'nhacungcap-index.html'
                }, function (e) {
                        console.log(e);
                });

        }
});
//
app.controller('hoadonnhap', function ($scope, $http, $location) {
        $scope.maxsize = 5;

        $scope.totalcount = 0;

        $scope.pageIndex = 1;

        $scope.pageSize = 5;

        $scope.searchText = '';
        //----------------------------------------------------------------------------------------------------------------
        $scope.NCCList = function () {
                $http.get(current_url + "HoaDonNhap/get-hoadonnhap/" + $scope.pageIndex + "/" + $scope.pageSize).then(function (response) {
                        $scope.listhdn = response.data.listHoaDonNhap;
                        $scope.totalcount = response.data.totalcount;
                        // console.log(response.data);

                }, function (error) {
                        alert('Có lỗi xảy ra');
                });
        }
        $scope.NCCList();
        $scope.pagechanged = function () {
                $scope.NCCList();

        }
        $scope.changePageSize = function () {
                $scope.pageIndex = 1;
                $scope.NCCList();
        }
        //
        $scope.delete = function (id) {
                $http.get(current_url + "NhaCungCap/delete-ncc/" + id).then(function (d) {
                        alert('xóa thành công');
                        $http.get(current_url + "NhaCungCap/get-ncc/" + $scope.pageIndex + "/" + $scope.pageSize).then(function (response) {
                                $scope.listncc = response.data.listNCC;
                                $scope.totalcount = response.data.totalcount;
                                console.log(listncc);
                        }, function (error) {
                                alert('Có lỗi xảy ra');
                        });
                }, function (error) {
                        alert('Có lỗi xảy ra');
                });

        };
        $http.get(current_url + "NhaCungCap/get-all").then(function (response) {
                $scope.listncc = response.data;
                console.log($scope.listncc);
        }, function (error) {
                alert('Có lỗi xảy ra');
        });
        $scope.save = function () {
                var date = new Date();
                var month = date.getMonth() + 1;
                var id = 'MHD' + Math.floor(Math.random() * 1000000) + '/' + month + '-' + date.getDate() + '-' + date.getFullYear();
                localStorage.setItem('mahdn', id);
                $http({
                        method: 'POST',
                        data: {
                                "MaHoaDonNhap": id,
                                "MaNCC": ~~$scope.mancc,
                                "NgayNhap": $scope.ngaynhap,
                                "TongTien": ~~$scope.tongtien
                        },
                        url: current_url + 'HoaDonNhap/create-hoadonnhap'
                }).then(function (d) {
                        alert("Thêm thành công");
                        window.location.href = 'hoadonnhap-index.html'
                }, function (e) {
                        console.log(e);
                });
        }
        $scope.savedetail = function () {
                $http({
                        method: 'POST',
                        data: $scope.ncc,
                        url: current_url + 'HoaDonNhap/create-cthoadonnhap'
                }).then(function (d) {
                        alert("Thêm thành công");
                        window.location.href = 'hoadonnhap-index.html'
                }, function (e) {
                        console.log(e);
                });
        }

        $scope.LoaiLisst = function () {
                $http.get(current_url + "Camera/get-all").then(function (response) {
                        $scope.listCamera = response.data;
                        console.log($scope.listCamera);

                }, function (error) {
                        alert('Có lỗi xảy ra');
                });
        }
        $scope.LoaiLisst();


});
app.controller('donhang', function ($scope, $http, $location) {
        $scope.maxsize = 5;

        $scope.totalcount = 0;

        $scope.pageIndex = 1;

        $scope.pageSize = 5;

        $scope.searchText = '';
        //----------------------------------------------------------------------------------------------------------------
        $scope.OderNotComfirm = function () {
                $http.get(current_url + "DonHang/get-donhang-chuaxacthuc/" + $scope.pageIndex + "/" + $scope.pageSize).then(function (response) {
                        $scope.listdh = response.data.listDonHang;
                        $scope.totalcount = response.data.totalcount;
                        console.log($scope.listdh);

                }, function (error) {
                        alert('Có lỗi xảy ra');
                });
        }
        $scope.OderNotComfirm();
        $scope.pagechangeds = function () {
                $scope.OderNotComfirm();

        }
        $scope.changePageSizes = function () {
                $scope.pageIndex = 1;
                $scope.OderNotComfirm();
        }
        //
        $scope.OrerComfirm = function () {
                $http.get(current_url + "DonHang/get-donhang-daxacthuc/" + $scope.pageIndex + "/" + $scope.pageSize).then(function (response) {
                        $scope.ordcomfirm = response.data.listDonHang;
                        $scope.totalcount = response.data.totalcount;

                }, function (error) {
                        alert('Có lỗi xảy ra');
                });
        }
        $scope.OrerComfirm();
        $scope.pagechanged = function () {
                $scope.OrerComfirm();

        }
        $scope.changePageSize = function () {
                $scope.pageIndex = 1;
                $scope.OrerComfirm();
        }
        //
        $scope.OrerDelivered = function () {
                $http.get(current_url + "DonHang/get-donhang-dagiao/" + $scope.pageIndex + "/" + $scope.pageSize).then(function (response) {
                        $scope.orddelivered = response.data.listDonHang;
                        $scope.totalcount = response.data.totalcount;
                        console.log($scope.listdh);

                }, function (error) {
                        alert('Có lỗi xảy ra');
                });
        }
        $scope.OrerDelivered();
        $scope.pagechanged = function () {
                $scope.OrerDelivered();

        }
        $scope.changePageSize = function () {
                $scope.pageIndex = 1;
                $scope.OrerDelivered();
        }

        // 
        $scope.OrerDestroy = function () {
                $http.get(current_url + "DonHang/get-donhang-dahuy/" + $scope.pageIndex + "/" + $scope.pageSize).then(function (response) {
                        $scope.orddestroy = response.data.listDonHang;
                        $scope.totalcount = response.data.totalcount;
                        console.log($scope.listdh);

                }, function (error) {
                        alert('Có lỗi xảy ra');
                });
        }
        $scope.OrerDestroy();
        $scope.pagechanged = function () {
                $scope.OrerDestroy();

        }
        $scope.changePageSize = function () {
                $scope.pageIndex = 1;
                $scope.OrerDestroy();
        }
        //
        $scope.comfirm = function (id) {
                $http.get(current_url + "DonHang/xacthuc/" + id).then(function (d) {
                        alert('xác thực thành công');
                        $http.get(current_url + "DonHang/get-donhang-chuaxacthuc/" + $scope.pageIndex + "/" + $scope.pageSize).then(function (response) {
                                $scope.listdh = response.data.listDonHang;
                                $scope.totalcount = response.data.totalcount;
                                console.log($scope.listdh);
                        }, function (error) {
                                alert('Có lỗi xảy ra');
                        });
                }, function (error) {
                        alert('Có lỗi xảy ra');
                });

        };
        $scope.cancel = function (id) {
                $http.get(current_url + "DonHang/huy-donhang/" + id).then(function (d) {
                        alert('Hủy thành công');
                        $http.get(current_url + "DonHang/get-donhang-chuaxacthuc/" + $scope.pageIndex + "/" + $scope.pageSize).then(function (response) {
                                $scope.listdh = response.data.listDonHang;
                                $scope.totalcount = response.data.totalcount;
                                console.log($scope.listdh);
                        }, function (error) {
                                alert('Có lỗi xảy ra');
                        });
                }, function (error) {
                        alert('Có lỗi xảy ra');
                });
        };
        $scope.restore = function (id) {
                $http.get(current_url + "DonHang/restore/" + id).then(function (d) {
                        alert('Khôi phục thành công');
                        $http.get(current_url + "DonHang/get-donhang-dahuy/" + $scope.pageIndex + "/" + $scope.pageSize).then(function (response) {
                                $scope.orddestroy = response.data.listDonHang;
                                $scope.totalcount = response.data.totalcount;
                        }, function (error) {
                                alert('Có lỗi xảy ra');
                        });
                }, function (error) {
                        alert('Có lỗi xảy ra');
                });
        };
});
app.controller('trangthaidonhang', function ($scope, $http, $location) {
        $http.get(current_url + "DonHang/get-by-id/" + $location.search().MaDonHang).then(function (d) {
                $scope.donhang = d.data;
                console.log($scope.donhang);
        }, function (error) {
                alert('Có lỗi xảy ra');
        });
        $scope.update = function () {
                var dh = {
                        "MaDonHang": $scope.donhang.maDonHang,
                        "TrangThaiDonHang": $scope.donhang.trangThaiDonHang,
                        "TrangThaiVanChuyen": $scope.donhang.trangThaiVanChuyen,
                        "TrangThaiThanhToan": $scope.donhang.trangThaiThanhToan
                }
                $http({
                        method: 'POST',
                        data: dh,
                        url: current_url + 'DonHang/update-status'
                }).then(function (d) {
                        alert("Cập nhật trạng thái thành công");
                        window.location.href = 'donhangdaxacthuc.html'
                }, function (e) {
                        console.log(e);
                });
        }
});
app.controller('thongke', function ($scope, $http) {
        $http({
                method: "GET",
                headers: {
                        "Authorization": 'Bearer ' + _user.token
                },
                url: current_url + "HangSanXuat/get-all"
        }).then(function (response) {
                $scope.hangsx = response.data;
        })
        $http({
                method: "GET",
                headers: {
                        "Authorization": 'Bearer ' + _user.token
                },
                url: current_url + "LoaiCamera/get-menu"
        }).then(function (response) {
                $scope.listmenu = response.data;
        })
        $http({
                method: "GET",
                url: current_url + "DonHang/getall-donhang"
        }).then(function (response) {
                $scope.donhang = response.data.listDonHang;
                var obj = $scope.donhang;
                console.log(obj);

                $.each(obj, function (key, value) {
                        var t = 0;                       
                        if (value.trangThaiDonHang === "Chưa xác thực") {
                                t += 1;
                                console.log(t);
                                $scope.countnotcf = t;
                        }

                });
                $.each(obj, function (key, value) {
                        var total = 0;
                        if (value.trangThaiThanhToan === "Đã thanh toán") {
                                total += value.tongTien;
                                console.log(total);
                                $scope.totalall = total;
                        }
                });
        })

});
function removeDumplicateValue(myArray) {
        var newArray = [];

        angular.forEach(myArray, function (value, key) {
                var exists = false;
                angular.forEach(newArray, function (val2, key) {
                        if (angular.equals(value.tenHang, val2.tenHang)) { exists = true };
                });
                if (exists == false && value.tenHang != "") { newArray.push(value); }
        });

        return newArray;
}

