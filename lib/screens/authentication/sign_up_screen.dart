part of '../screens.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController reEnterController = TextEditingController();
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        switch (state.status) {
          case SignUpStatus.init:
            break;
          case SignUpStatus.success:
            NavigationService()
                .navigateFinishToWithContext(context, Routes.loginRoute);
            break;
          case SignUpStatus.fail:
            showCupertinoModalPopup(
                context: context,
                builder: (BuildContext dialogContext) => CupertinoAlertDialog(
                      title: Text("Sign Up fail"),
                      actions: [
                        ElevatedButton(
                            onPressed: () => Navigator.of(dialogContext).pop(),
                            child: Text("Back"))
                      ],
                    ));
            break;
        }
      },
      child: ImageScaffold(
        title: "Mừng bạn trở lại",
        assetName: Images.loginBackGround,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
            child: Text(
              "Tài khoản",
              style: TextStyle(color: AppColors.textTitleColor, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
            child: AccountFormField(
                controller: emailController,
                hintText: "Nhập tài khoản",
                textColor: Colors.white,
                hintTextColor: AppColors.textHintColor),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 28, 0, 0),
            child: Text(
              "Mật khẩu",
              style: TextStyle(color: AppColors.textTitleColor, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
            child: PassFormField(
              textEditingController: passController,
              hintText: "Nhập mật khẩu",
              textColor: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
            child: Text(
              "Nhập lại mật khẩu",
              style: TextStyle(color: AppColors.textTitleColor, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
            child: PassFormField(
              textEditingController: reEnterController,
              hintText: "Nhập lại mật khẩu",
              textColor: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
            child: GestureDetector(
              onTap: () {
                context.read<SignUpBloc>().add(SignUpSubmit(
                    email: emailController.value.text,
                    password: passController.value.text));
              },
              child: Container(
                height: size.height * 0.05,
                width: size.width,
                decoration: BoxDecoration(
                    color: AppColors.playButtonColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "ĐĂNG KÍ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: FontFamilies.josefinSans),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Hoặc",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 16, 60, 0),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 16,
                    child: Image.asset(Images.facebook),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 16,
                    child: Image.asset(Images.google),
                  ),
                  CircleAvatar(
                    radius: 16,
                    child: Image.asset(
                      Images.twitter,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 20, 60, 0),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'Đã  có tài khoản? ',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Đăng nhập',
                        style:
                            const TextStyle(color: Colors.orange, fontSize: 12),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => NavigationService()
                              .navigateFinishToWithContext(
                                  context, Routes.loginRoute)),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
