import 'package:demo_donation/src/const/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateDonor extends StatefulWidget {
  const UpdateDonor({Key? key}) : super(key: key);

  @override
  State<UpdateDonor> createState() => _UpdateDonorState();
}

class _UpdateDonorState extends State<UpdateDonor> {
  final nameController =TextEditingController();
  final numberController = TextEditingController();
  final bloodgroupController = TextEditingController();
  final bloodGroup  =["A+","B+","AB-","AB+","A-","B-","A-","0-","0+"];
  String ? selectedGroup;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Donate Update"),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText:"Donor Name" ,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
              ),
              SizedBox(height: 30),
              TextFormField(
                // controller: numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText:"Phone Number" ,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
              ),
              SizedBox(height: 30),
              DropdownButtonFormField(
                  decoration:InputDecoration(
                      labelText:"Select Blood Group" ,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
                  items:  bloodGroup.map((e) => DropdownMenuItem(
                    child: Text(e),value: e,
                  )).toList() ,
                  onChanged: (val){
                    selectedGroup=val as String?;
                  }),
              SizedBox(height: 50),
              ElevatedButton(onPressed: ()async{
                await firestore.collection(donorsCollection).add({
                  "donorname":nameController.text,
                  "phonenumber":numberController,
                  "bloodgroup":selectedGroup.toString()
                });
              },

                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          Size(double.infinity,50)),
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: Text("Submit") )
            ],

          ),
        ),
      ),

    );
  }
}
