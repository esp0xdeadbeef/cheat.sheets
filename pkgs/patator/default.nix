{ lib
, stdenvNoCC
, fetchFromGitHub
, makeWrapper
, python313
, python313Packages
}:

let
  python = python313.withPackages (ps: with ps; [
    ipy
    paramiko
  ]);
in
stdenvNoCC.mkDerivation {
  pname = "patator";
  version = "1.1.0-unstable-2026-06-21";

  src = fetchFromGitHub {
    owner = "lanjelot";
    repo = "patator";
    rev = "964e87c4932fc20f3d0c3226a8e409eae527e831";
    sha256 = "0n02c5wkjijhf194gl69wl5mi7zk4hszhjzibr9nxjn4j38kzig8";
  };

  nativeBuildInputs = [
    makeWrapper
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/share/patator" "$out/bin"
    cp -r src/patator "$out/share/patator/"

    makeWrapper ${python}/bin/python3 "$out/bin/patator" \
      --add-flags "$out/share/patator/patator/patator.py" \
      --set PYTHONPATH "$out/share/patator"

    runHook postInstall
  '';

  meta = {
    description = "Multi-purpose brute-forcer";
    homepage = "https://github.com/lanjelot/patator";
    license = lib.licenses.gpl2Only;
    mainProgram = "patator";
  };
}
