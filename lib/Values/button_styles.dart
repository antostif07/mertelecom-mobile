part of values;

class ButtonStyles {
  static final ButtonStyle blueRounded = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(HexColor.fromHex("246cfe")),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: BorderSide(color: HexColor.fromHex("246cfe"))
        )
    )
  );

  static final ButtonStyle imageRounded = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(HexColor.fromHex("181a1f")),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(color: HexColor.fromHex("666a7a"), width: 1)
          )
      )
  );
}