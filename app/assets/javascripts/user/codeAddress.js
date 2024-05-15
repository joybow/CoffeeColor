function codeAddress(){
  let inputAddress = document.getElementById('address').value;

  geocoder.geocode({'address': inputAddress}, function (results, status) {
    if (status == 'OK') {
      map.setCenter(results[0].geometry.location);
      let marker = new google.maps.Marker({
        map: map,
        position: results[0].geometry.location
      });
    } else {
      alert ('該当結果がありませんでした:' + status)
    }
  });
}