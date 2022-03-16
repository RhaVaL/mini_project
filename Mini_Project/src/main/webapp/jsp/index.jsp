<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript" src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/webrtc-adapter/3.3.3/adapter.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>

    <button type="button" class="btn btn-primary" onclick="ScanBtn()" id="scanBtn" data-toggle="modal" data-target="#exampleModalCenter">
        Launch demo modal
      </button>
      
      <!-- Modal -->
      <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-body">
                <video id="preview" width="100%"></video>
                <input type="text" name="text" id="text" readonly="" placeholder="scan qrcoode" class="form-control">
            </div>
          </div>
        </div>
      </div>

    <!-- <div class="container">
        
        <div class="row">
            <div class="col-md-6">
                <video id="preview" width="50%"></video>
            </div>
            <div class="col-md-6">
                <label>Scan QR Code</label>
                <input type="text" name="text" id="text" readonly="" placeholder="scan qrcoode" class="form-control">
                <button id="scanBtn" onclick="ScanBtn()">Scan</button>
                <button id="closeBtn" onclick="CloseBtn()">Close</button>
            </div>
        </div>
    </div> -->

    <script>



        function ScanBtn(){
        

            let scanner = new Instascan.Scanner({video: document.getElementById('preview')});
            Instascan.Camera.getCameras().then(function(cameras){
                if (cameras.length > 0) {
                    scanner.start(cameras[0]);
                } else {
                    alert("no camera found");
                }
            }).catch(function (e) {
                console.error(e);
            });
            
            scanner.addListener('scan',function(c){
                document.getElementById('text').value = c;
            })
        }
        
    </script>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

