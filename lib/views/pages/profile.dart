import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validus_coin/viewmodels/store_user_details_viewmodel.dart';
import 'package:validus_coin/views/widgets/page_title.dart';
import 'package:validus_coin/views/widgets/profile_card.dart';

import '../../models/userdetail_model.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {

      UserDetails userDetails = Provider.of<UserDetails>(context);
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              const PageTitle('Profile'),
              Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      ProfileCard(
                        label: 'Name',
                        value: userDetails.getUsername(),
                        modalFieldLabel: 'Name',
                        modalMessage:
                            "We'll send you an email to confirm you new name",
                        modalTitle: 'Edit Name',
                        modalValidationMessage: 'Please enter valid name',
                        onPressed: (content) async {
                          Provider.of<UserDetails>(context, listen: false)
                              .setUsername(content);
                          await UserDetailsSharedPreference.saveUsername(
                              content);
                        },
                        currentInputValue: userDetails.getUsername()
                      ),
                      // Email
                      ProfileCard(
                        label: 'Email',
                        value: userDetails.getEmail(),
                        modalFieldLabel: 'Email',
                        modalMessage:
                            "We'll send you an email to confirm you new email address",
                        modalTitle: 'Edit Email',
                        modalValidationMessage: 'Please enter valid email',
                        onPressed: (content) async {
                          Provider.of<UserDetails>(context, listen: false)
                              .setEmail(content);
                          await UserDetailsSharedPreference.saveEmail(content);
                        },
                        currentInputValue: userDetails.getEmail()
                      ),
                      // Address
                      ProfileCard(
                        label: 'Address',
                        value: userDetails.getAddress(),
                        modalFieldLabel: 'Address',
                        modalMessage:
                            "We'll send you an email to confirm you new email address",
                        modalTitle: 'Edit Address',
                        modalValidationMessage: 'Please enter valid address',
                        onPressed: (content) async {
                          Provider.of<UserDetails>(context, listen: false)
                              .setAddress(content);
                          await UserDetailsSharedPreference.saveAddress(
                              content);
                        },
                        currentInputValue: userDetails.getAddress()
                      ),
                    ],
                  ))
            ],
          ),
        ),
      );
    }
  }

