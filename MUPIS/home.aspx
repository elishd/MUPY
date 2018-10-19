<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/masterPage.Master" CodeBehind="home.aspx.vb" Inherits="MUPIS.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style>
        /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
        #map {
            margin: 20px auto;
            border: 1px dashed #C0C0C0;
            width: 100%;
            height: 400px;
        }
        /* Optional: Makes the sample page fill the window. */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
    <label aria-label="center"> UBICACIONES DE MUPY </label>
        <br />
    <div id="map"></div>

    <script>
        var markers = <%=map()%>
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 14,
                center: { lat: 13.639503, lng: -88.781363 },
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });

            for (var i = 0; i < markers.length; ++i) {
                var data = markers[i];
                var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    title: data.title,
                    map: map
                });

                attachSecretMessage(marker, data.description);
            }
        }

        // Attaches an info window to a marker with the provided message. When the
        // marker is clicked, the info window will open with the secret message.
        function attachSecretMessage(marker, secretMessage) {
            var infowindow = new google.maps.InfoWindow({
                content: secretMessage
            });

            marker.addListener('click', function () {
                infowindow.open(marker.get('map'), marker);
            });
        }
    </script>

    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKSsN2WfVh3jkrASwLW_sv1qlB2bkZzKg&callback=initMap">
    </script>
</asp:Content>
