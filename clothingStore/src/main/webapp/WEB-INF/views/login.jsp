<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="/css/slick.css">
  <link rel="stylesheet" type="text/css" href="/css/slick-theme.css">
  <style type="text/css">
    html, body {
      margin: 0;
      padding: 0;
    }

    * {
      box-sizing: border-box;
    }

    .slider {
        width: 50%;
        margin: 100px auto;
    }

    .slick-slide {
      margin: 0px 20px;
    }

    .slick-slide img {
      width: 100%;
    }

    .slick-prev:before,
    .slick-next:before {
      color: black;
    }


    .slick-slide {
      transition: all ease-in-out .3s;
      opacity: .2;
    }
    
    .slick-active {
      opacity: .5;
    }

    .slick-current {
      opacity: 1;
    }
  </style>
</head>
<body>
<body>
  <section class="regular slider">
    <div>
      <img src="http://placehold.it/350x300?text=1">
    </div>
    <div>
      <img src="http://placehold.it/350x300?text=2">
    </div>
    <div>
      <img src="http://placehold.it/350x300?text=3">
    </div>
    <div>
      <img src="http://placehold.it/350x300?text=4">
    </div>
    <div>
      <img src="http://placehold.it/350x300?text=5">
    </div>
    <div>
      <img src="http://placehold.it/350x300?text=6">
    </div>
  </section>

  <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
  <script src="/css/slick.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
    $(document).on('ready', function() {      
      $(".regular").slick({
        dots: true,
        infinite: false,
        slidesToShow: 3,
        slidesToScroll: 3
      });
    });
</script>

</body>
</body>
</html>