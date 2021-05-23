import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:slip_go/Cart/CartItem.dart';
import 'package:slip_go/Cart/cartmodel.dart';



class CartProduct extends StatefulWidget {
  final String title, orderBy,email;

  //TODO: make it dynamic
  const CartProduct({
    Key key,
    @required this.title,
    @required this.orderBy, this.email,
  }) : super(key: key);

  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends State<CartProduct> {
  ScrollController scrollController = ScrollController();

  //TODO: it's better to move the heavy logic away of widget tree, move the pagination away
  /// pagination
  List<CartItem> products = [];

  //always holds last document after initializeProducts() runs
  QueryDocumentSnapshot _lastDocument;

  final _firestore = FirebaseFirestore.instance;

  //TODO: check for required perPage count
  //how many objects to load in each time
  int _perPage = 10;

  //to notify listeners that something loading
  // also used to avoid calling the same function many times
  bool isLoading = false;

  //it's false if there's no more products
  bool _isMoreProducts = true;

  //this method gets first 15 products
  Future<void> initializeProducts() async {
    print('initialize products called');

    Query initProduct = _firestore
        .collection('Products')
        .orderBy(widget.orderBy)
        .limit(_perPage);

    setState(() {
      isLoading = true;
    });

    //getting first products
    QuerySnapshot querySnapshot = await initProduct.get();

    setState(() {
      querySnapshot.docs.forEach((element) {
        products.add(CartItem(product:
        CartModel(
            productId: element.id,
            name: element.data()['name'],
            imageUrl: element.data()['imageUrl'],
            description: element.data()['description'],
            brand: element.data()['brand'],
            category: element.data()['category'],
            //this is how to parse iso string to DateTime object
            //date: DateTime.parse(element.data()['date']),
            date: element.data()['date'],
            quantity: element.data()['quantity'],
            price: element.data()['price'],
            sellCount: element.data()['sellCount'],
            offer: element.data()['offer']),
          email:widget.email,));
      });

      _lastDocument = querySnapshot.docs.last;

      isLoading = false;
    });
  }

  //adding more products
  Future<void> getMoreProducts() async {
    //check if the method is already running !
    if (isLoading) return;

    if (!_isMoreProducts) {
      print('no more products available');
      return;
    }

    print('get more products called');

    Query addProducts = _firestore
        .collection('Products')
        .orderBy(widget.orderBy)
        .startAfter([_lastDocument.data()[widget.orderBy]]).limit(_perPage);

    setState(() {
      isLoading = true;
    });

    QuerySnapshot querySnapshot = await addProducts.get();

    setState(() {
      querySnapshot.docs.forEach((element) {
        products.add(
            CartItem(
            product:CartModel(
                productId: element.id,
                name: element.data()['name'],
                imageUrl: element.data()['imageUrl'],
                description: element.data()['description'],
                brand: element.data()['brand'],
                category: element.data()['category'],
                date: element.data()['date'],
                //this is how to parse iso string to DateTime object
                quantity: element.data()['quantity'],
                price: element.data()['price'],
                sellCount: element.data()['sellCount'],
                offer: element.data()['offer'])));
      });

      if (querySnapshot.docs.length < _perPage) _isMoreProducts = false;

      _lastDocument = querySnapshot.docs.last;

      isLoading = false;
    });
  }


  @override
  initState() {
    super.initState();
    scrollController.addListener(listen);
    //TODO: this initialization should be in splashScreen !!
    initializeProducts();
  }

  void listen() {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    double delta = MediaQuery.of(context).size.width * 0.25;

    //if the current list index on 3rd element
    if (maxScroll - currentScroll < delta) {
      getMoreProducts();
    }
  }

  @override
  dispose() {
    super.dispose();
    scrollController.removeListener(listen);
    scrollController.dispose();
  }

  Widget build(BuildContext context) {
    //converting each Product object to ProductItem
    List<Widget> _products = [
      ...products,

      //checking if the provider is loading more products
      if (isLoading)
        Center(
          child: CircularProgressIndicator(),
        )
    ];

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: MediaQuery.of(context).size.height/3,
              child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  itemCount: _products.length,
                  itemBuilder: (context, index) => _products[index]
              )),
        ],
      ),
    );
  }
}
