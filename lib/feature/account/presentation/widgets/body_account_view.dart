import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/account/presentation/cubit/account_cubit.dart';
import 'package:fresco/feature/account/presentation/cubit/account_state.dart';
import 'package:fresco/feature/account/presentation/widgets/account_header_section.dart';
import 'package:fresco/feature/account/presentation/widgets/account_info_field.dart';
import 'package:fresco/feature/account/presentation/widgets/account_logout_button.dart';

class AccountViewBody extends StatefulWidget {
  const AccountViewBody({super.key});

  @override
  State<AccountViewBody> createState() => _AccountViewBodyState();
}

class _AccountViewBodyState extends State<AccountViewBody> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();

  final Map<String, bool> _isEditing = {
    'name': false,
    'phone': false,
    'address': false,
  };

  bool _isInitialized = false;

  void toggleEdit(String field) {
    setState(() {
      _isEditing[field] = !(_isEditing[field] ?? false);
    });
  }

  void _fillControllers(AccountLoaded state) {
    if (_isInitialized) return;

    final user = state.user;

    nameController.text = user.name;
    phoneController.text = user.phone;
    addressController.text = user.address;
    emailController.text = user.email;

    _isInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state is AccountLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        }

        if (state is AccountError) {
          return Center(child: Text(state.errMsg));
        }

        if (state is AccountLoaded) {
          _fillControllers(state);

          final user = state.user;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountHeaderSection(email: user.email),

                AccountInfoField(
                  title: 'Your full name',
                  controller: nameController,
                  isEditing: _isEditing['name'] ?? false,
                  onEdit: () => toggleEdit('name'),
                  onSave: () {
                    context.read<AccountCubit>().updateUser(
                      name: nameController.text,
                      phone: phoneController.text,
                      address: addressController.text,
                    );
                    toggleEdit('name');
                  },
                ),

                SizedBox(height: 10.h),

                AccountInfoField(
                  title: 'Your E-mail',
                  controller: emailController,
                  isEditing: false,
                  onEdit: () {},
                  onSave: () {},
                ),

                SizedBox(height: 10.h),

                AccountInfoField(
                  title: 'Your mobile number',
                  controller: phoneController,
                  isEditing: _isEditing['phone'] ?? false,
                  onEdit: () => toggleEdit('phone'),
                  onSave: () {
                    context.read<AccountCubit>().updateUser(
                      name: nameController.text,
                      phone: phoneController.text,
                      address: addressController.text,
                    );
                    toggleEdit('phone');
                  },
                ),

                SizedBox(height: 10.h),

                AccountInfoField(
                  title: 'Your address',
                  controller: addressController,
                  isEditing: _isEditing['address'] ?? false,
                  onEdit: () => toggleEdit('address'),
                  onSave: () {
                    context.read<AccountCubit>().updateUser(
                      name: nameController.text,
                      phone: phoneController.text,
                      address: addressController.text,
                    );
                    toggleEdit('address');
                  },
                ),

                SizedBox(height: 20.h),

                const AccountLogoutButton(),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
