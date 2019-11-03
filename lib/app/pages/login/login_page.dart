import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quiz_me_app/app/repositories/auth_repository.dart';
import 'package:quiz_me_app/app/utils/constants/resources.dart';
import 'package:quiz_me_app/app/utils/constants/theme.dart';
// import 'package:qrscan/qrscan.dart' as scanner;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

  AnimationController _animationController;
  Animation<double> _animationLogo;
  Animation<double> _animationButton;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    )
      ..addListener(() {
        setState(() {});
      })
      ..forward();

    _animationLogo = Tween<double>(
      begin: 0.0,
      end: 200.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    ));

    _animationButton = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInCubic,
    ));

    _obscurePassword = true;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          _buildLogo(),
          _buildLoginForm(),
          _signInButton(),
          _signUpLink(),
          _BuildQrCode(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .30,
      margin: EdgeInsets.only(top: 20.0),
      alignment: Alignment.center,
      child: Image(
        image: AssetImage(Resources.logo),
        fit: BoxFit.contain,
        height: _animationLogo.value,
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _loginFormKey,
      child: Container(
        margin: EdgeInsets.only(top: 50.0),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _emailTextField(),
            _passwordTextField(),
            _forgotPasswordLink(),
          ],
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.email),
        Container(
          margin: EdgeInsets.only(bottom: 20.0),
          width: MediaQuery.of(context).size.width * .70,
          child: TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              isDense: true,
              labelText: 'Email Address',
            ),
            style: CustomTheme().formField,
          ),
        ),
      ],
    );
  }

  Widget _passwordTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.vpn_key),
        Container(
          width: MediaQuery.of(context).size.width * .70,
          child: TextFormField(
            controller: passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              isDense: true,
              labelText: 'Password',
              suffixIcon: GestureDetector(
                onTap: () => _toggleObscure(),
                child: Icon(
                  _obscurePassword
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  color: Colors.black,
                  size: 16.0,
                ),
              ),
            ),
            style: CustomTheme().formField,
          ),
        ),
      ],
    );
  }

  Widget _forgotPasswordLink() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(''),
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _signInButton() {
    return Opacity(
      opacity: _animationButton.value,
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 50.0, bottom: 15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.teal[400],
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
                offset: Offset(0.0, 3.0),
              ),
            ],
          ),
          child: MaterialButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.0),
              child: Provider.of<AuthRepository>(context).status ==
                      Status.Authenticating
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: SizedBox(
                        height: 25.0,
                        width: 25.0,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      ),
                    )
                  : Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontFamily: 'Montserrat',
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w600),
                    ),
            ),
            onPressed: () =>
                Provider.of<AuthRepository>(context).signInWithEmailAndPassword(
              emailController.text,
              passwordController.text,
            ),
          ),
        ),
      ),
    );
  }

  Widget _signUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Don\'t have an account? ',
          style: TextStyle(color: Colors.grey),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Sign up',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }

  Widget _BuildQrCode() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 25.0),
          Text(
            'Scan QR Code',
            style: TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
          SizedBox(height: 5.0),
          GestureDetector(
            onTap: () async {
              // String cameraScanResult = await scanner.scanPhoto();
            },
            child: Icon(
              FontAwesomeIcons.qrcode,
              size: 65.0,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  void _toggleObscure() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }
}
