import 'package:flutter_store/features/shop/models/brand_model.dart';
import 'package:flutter_store/features/shop/models/product_attribute_model.dart';
import 'package:flutter_store/features/shop/models/product_variation_model.dart';
import 'package:flutter_store/utils/constants/image_strings.dart';

import '../../features/shop/models/category_model.dart';
import '../../features/shop/models/product_model.dart';

class TDummyData {
  /// -- List of All Categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Electronics', image: TImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Clothes', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Furniture', image: TImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Sports', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Cosmetics', image: TImages.cosmeticsIcon, isFeatured: true),
    CategoryModel(id: '17', name: 'Jewelery', image: TImages.jeweleryIcon, isFeatured: true),

    /// Subcategories
    CategoryModel(id: '8', name: 'Sport Shoes', parentId: '1' ,image: TImages.sportIcon, isFeatured: false),
    CategoryModel(id: '9', name: 'Track suits', parentId: '1' ,image: TImages.sportIcon, isFeatured: false),
    CategoryModel(id: '10', name: 'Sport Equipment', parentId: '1' ,image: TImages.sportIcon, isFeatured: false),

    CategoryModel(id: '11', name: 'Bedroom furniture', parentId: '5' ,image: TImages.furnitureIcon, isFeatured: false),
    CategoryModel(id: '12', name: 'Kitchen furniture', parentId: '5' ,image: TImages.furnitureIcon, isFeatured: false),
    CategoryModel(id: '13', name: 'Office furniture', parentId: '5' ,image: TImages.furnitureIcon, isFeatured: false),

    CategoryModel(id: '14', name: 'Laptop', parentId: '2' ,image: TImages.electronicsIcon, isFeatured: false),
    CategoryModel(id: '15', name: 'Mobile', parentId: '2' ,image: TImages.electronicsIcon, isFeatured: false),

    CategoryModel(id: '16', name: 'Shirts', parentId: '3' ,image: TImages.clothIcon, isFeatured: false),
  ];

  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: 'Green Nike sports Shoe',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: TImages.productImage1,
        description: 'Green Nike sports Shoe',
        brand: BrandModel(id: '1', name: 'Nike', image: TImages.nikeLogo, productsCount: 256, isFeatured: true),
        images: [TImages.productImage1, TImages.productImage23, TImages.productImage21, TImages.productImage9],
        salePrice: 30,
        sku: 'TBHT123',
        categoryId: '1',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
          ProductAttributeModel(name: 'Size', values: ['EU30', 'EU3032', 'EU34']),
        ],
        productVariations: [
          ProductVariationModel(id: '1', stock: 34, price: 134, salePrice: 122.6, image: TImages.productImage1, description: 'This is a Product description for Nike sports shoe', attributeValues: {'Color': 'Green', 'Size' : 'EU34'}),
          ProductVariationModel(id: '2', stock: 15, price: 132,  image: TImages.productImage23,  attributeValues: {'Color': 'Black', 'Size' : 'EU32'}),
          ProductVariationModel(id: '3', stock: 0, price: 234,  image: TImages.productImage23,  attributeValues: {'Color': 'Black', 'Size' : 'EU34'}),
          ProductVariationModel(id: '4', stock: 222, price: 250,  image: TImages.productImage1,  attributeValues: {'Color': 'Green', 'Size' : 'EU32'}),
          ProductVariationModel(id: '5', stock: 0, price: 334,  image: TImages.productImage21,  attributeValues: {'Color': 'Red', 'Size' : 'EU34'}),
          ProductVariationModel(id: '6', stock: 11, price: 320,  image: TImages.productImage21,  attributeValues: {'Color': 'Red', 'Size' : 'EU32'}),
        ],
        productType: 'ProductType.variable'),

    ProductModel(
        id: '002',
        title: 'Blue T-shirt for all ages',
        stock: 15,
        price: 35,
        isFeatured: true,
        thumbnail: TImages.productImage69,
        description: 'Blue T-shirt for all ages',
        brand: BrandModel(id: '6', name: 'ZARA', image: TImages.zaraLogo),
        images: [TImages.productImage68, TImages.productImage69, TImages.productImage5],
        salePrice: 30,
        sku: 'TBHT123',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
          ProductAttributeModel(name: 'Size', values: [ 'EU3032', 'EU34']),
        ],
        productType: 'ProductType.single'),

    ProductModel(
        id: '003',
        title: 'Leather brown Jacket',
        stock: 15,
        price: 35000,
        isFeatured: true,
        thumbnail: TImages.productImage64,
        description: 'Leather brown Jacket',
        brand: BrandModel(id: '6', name: 'ZARA', image: TImages.zaraLogo),
        images: [TImages.productImage68, TImages.productImage69, TImages.productImage5],
        salePrice: 30,
        sku: 'TBHT123',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
          ProductAttributeModel(name: 'Size', values: [ 'EU3032', 'EU34']),
        ],
        productType: 'ProductType.single'),
  ];

}
