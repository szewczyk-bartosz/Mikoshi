lib: {
  mikoshiOptions = {
    theme = lib.mkOption {
      default = "akasara";
      type = lib.types.str;
      description = "the theme that Mikoshi will use"
    };
  };
};
