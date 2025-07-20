class ProductModel {
  final List<HomeField> homeFields;
  final int notificationCount;

  ProductModel({required this.homeFields, required this.notificationCount});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      homeFields: (json['home_fields'] as List)
          .map((e) => HomeField.fromJson(e))
          .toList(),
      notificationCount: json['notification_count'] ?? 0,
    );
  }
}

class HomeField {
  final String type;
  final List<CarouselItem>? carouselItems;
  final List<Brand>? brands;
  final List<Category>? categories;
  final RfqBanner? rfq;
  final List<Product>? products;
  final int? collectionId;
  final String? name;
  final String? image;
  final BannerItem? banner;
  final List<BannerItem>? banners;

  HomeField({
    required this.type,
    this.carouselItems,
    this.brands,
    this.categories,
    this.rfq,
    this.products,
    this.collectionId,
    this.name,
    this.image,
    this.banner,
    this.banners,
  });

  factory HomeField.fromJson(Map<String, dynamic> json) {
    return HomeField(
      type: json['type'],
      carouselItems: json['carousel_items'] != null
          ? (json['carousel_items'] as List)
              .map((e) => CarouselItem.fromJson(e))
              .toList()
          : null,
      brands: json['brands'] != null
          ? (json['brands'] as List).map((e) => Brand.fromJson(e)).toList()
          : null,
      categories: json['categories'] != null
          ? (json['categories'] as List)
              .map((e) => Category.fromJson(e))
              .toList()
          : null,
      rfq: json['type'] == 'rfq' ? RfqBanner.fromJson(json) : null,
      products: json['products'] != null
          ? (json['products'] as List).map((e) => Product.fromJson(e)).toList()
          : null,
      collectionId: json['collection_id'],
      name: json['name'],
      image: json['image'],
      banner:
          json['banner'] != null ? BannerItem.fromJson(json['banner']) : null,
      banners: json['banners'] != null
          ? (json['banners'] as List)
              .map((e) => BannerItem.fromJson(e))
              .toList()
          : null,
    );
  }
}

class CarouselItem {
  final int id;
  final String image;
  final String type;

  CarouselItem({required this.id, required this.image, required this.type});

  factory CarouselItem.fromJson(Map<String, dynamic> json) {
    return CarouselItem(
      id: json['id'] ?? 0,
      image: json['image'] ?? "",
      type: json['type'] ?? "",
    );
  }
}

class Brand {
  final int id;
  final String name;
  final String image;

  Brand({required this.id, required this.name, required this.image});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      image: json['image'] ?? "",
    );
  }
}

class Category {
  final int id;
  final String name;
  final String image;

  Category({required this.id, required this.name, required this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      image: json['image'] ?? "",
    );
  }
}

class RfqBanner {
  final String image;

  RfqBanner({required this.image});

  factory RfqBanner.fromJson(Map<String, dynamic> json) {
    return RfqBanner(
      image: json['image'] ?? "",
    );
  }
}

class Product {
  final int id;
  final String name;
  final String image;
  final String currency;
  final String unit;
  final bool wishlisted;
  final bool rfqStatus;
  final int cartCount;
  final int futureCartCount;
  final bool hasStock;
  final String price;
  final String actualPrice;
  final String offer;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.currency,
    required this.unit,
    required this.wishlisted,
    required this.rfqStatus,
    required this.cartCount,
    required this.futureCartCount,
    required this.hasStock,
    required this.price,
    required this.actualPrice,
    required this.offer,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      image: json['image'] ?? "",
      currency: json['currency'] ?? "",
      unit: json['unit'] ?? "",
      wishlisted: json['wishlisted'] ?? false,
      rfqStatus: json['rfq_status'] ?? false,
      cartCount: json['cart_count'] ?? 0,
      futureCartCount: json['future_cart_count'] ?? 0,
      hasStock: json['has_stock'] ?? false,
      price: json['price'] ?? "",
      actualPrice: json['actual_price'] ?? "",
      offer: json['offer'] ?? "",
    );
  }
}

class BannerItem {
  final String image;
  final String type;
  final int id;

  BannerItem({required this.image, required this.type, required this.id});

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      image: json['image'] ?? "",
      type: json['type'] ?? "",
      id: json['id'] ?? 0,
    );
  }
}
