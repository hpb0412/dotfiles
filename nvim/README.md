# Khoa Do's Neovim

This is my `Lua` configuaration for my modern Neovim

## Requirement

- Neovim 0.6.1+
- MacOS Monterey 12.1 (and above)

## Notes

Since this configuaration target MacOS there are some notes for you if you want to reuse on other OSs

- `Options` key (a.k.a `Alt` key on other systems)
  On Mac, with standard international keyboard layout, everytime you use `<Options + number | letter>`
  you we recieve a Greek character.

  Therefore, once you need a combination of `<Options + number|letter>`, instead of using `<A-`, you
  should used the corresponding Greek character of that combination. Example:

  - `<A-j>` will be `∆`
  - `<A-k>` will be `˚`

- Too fast `timeoutlen` (of `lua/kd/options.lua`) may cause trouble for several tools
  - My current setup is `500ms` and it works very well for commenting stuff with my `gcc` key binding
  - But fastening it with `100ms` makes the commenting with `gcc` key binding not work anymore

## Acknowledgement

I am not myself figure out everything. Most of stuffs here are gather from internet.
Here are they with my big thanks ❤️ for their sharing:

- [Neovim from Scratch](https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ) series,
[Github](https://github.com/LunarVim/Neovim-from-scratch)
- [DevOnDuty](https://www.youtube.com/channel/UCFU7a7OMYfcpjtIpu2j47_Q)
- [AstroVim](https://github.com/kabinspace/AstroVim)
- Others 🙇

