{ hostname, ... }:

{
  imports = [
    ./${hostname}
  ];
}
