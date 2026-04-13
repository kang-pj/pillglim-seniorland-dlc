/**
 * 구글맵 초기화 JavaScript
 */

(function() {
    'use strict';

    // 구글맵 API 로드 완료 후 실행
    window.initMap = function() {
        const mapElement = document.getElementById('map');
        if (!mapElement) return;

        // 필그림시니어랜드 위치 (예시 좌표)
        const location = {
            lat: 37.5665,
            lng: 126.9780
        };

        // 맵 옵션
        const mapOptions = {
            center: location,
            zoom: 16,
            mapTypeControl: true,
            streetViewControl: true,
            fullscreenControl: true,
            zoomControl: true
        };

        // 맵 생성
        const map = new google.maps.Map(mapElement, mapOptions);

        // 마커 추가
        const marker = new google.maps.Marker({
            position: location,
            map: map,
            title: '필그림시니어랜드',
            animation: google.maps.Animation.DROP
        });

        // 정보 윈도우
        const infoWindow = new google.maps.InfoWindow({
            content: '<div style="padding: 10px;">' +
                     '<h3 style="margin: 0 0 5px 0;">필그림시니어랜드</h3>' +
                     '<p style="margin: 0;">서울특별시 강남구</p>' +
                     '</div>'
        });

        // 마커 클릭 시 정보 윈도우 표시
        marker.addListener('click', function() {
            infoWindow.open(map, marker);
        });

        // 길찾기 버튼
        const directionsBtn = document.getElementById('directionsBtn');
        if (directionsBtn) {
            directionsBtn.addEventListener('click', function() {
                const url = 'https://www.google.com/maps/dir/?api=1&destination=' + 
                           location.lat + ',' + location.lng;
                window.open(url, '_blank');
            });
        }
    };

    // 맵 로드 에러 처리
    window.mapLoadError = function() {
        const mapElement = document.getElementById('map');
        if (mapElement) {
            mapElement.innerHTML = '<div style="padding: 20px; text-align: center; color: #666;">' +
                                  '지도를 불러올 수 없습니다.<br>잠시 후 다시 시도해주세요.' +
                                  '</div>';
        }
    };

})();
