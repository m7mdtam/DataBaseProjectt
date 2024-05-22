import 'package:flutter/material.dart';

class PaymentForm extends StatefulWidget {
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final _formKey = GlobalKey<FormState>();

  late String _cardNumber;
  late String _cardName;
  late String _expiryDate;
  late String _cvv;
  void _saveinfo(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm save',
            style: TextStyle(fontSize: 30),
          ),
          content: Text(
            'Are you sure you want to save your credit card?!',
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'No',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop();
              },
              child: Text(
                'Yes',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Payment Processing',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(fontSize: 20, color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Credit Card Number',
                  labelStyle: TextStyle(fontSize: 20, color: Colors.white),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid credit card number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _cardNumber = value!;
                },
              ),
              TextFormField(
                style: TextStyle(fontSize: 20, color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Cardholder Name',
                  labelStyle: TextStyle(fontSize: 20, color: Colors.white),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the cardholder name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _cardName = value!;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      decoration: InputDecoration(
                          labelText: 'Expiry Date',
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.white),
                          hintText: "mm/yy"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the expiry date';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _expiryDate = value!;
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the CVV';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _cvv = value!;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Perform payment processing logic here
                        // You can use the values stored in _cardNumber, _cardName, _expiryDate, and _cvv variables
                      }
                    },
                    child: Text('cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        _saveinfo(context, 1);
                        // Perform payment processing logic here
                        // You can use the values stored in _cardNumber, _cardName, _expiryDate, and _cvv variables
                      }
                    },
                    child: Text('Pay'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
