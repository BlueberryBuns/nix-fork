{ hostname, ... }:

{
  imports = [
    ./${hostname}
  ];
}