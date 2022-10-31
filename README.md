## Uranus

![Main](screenshots/main.png)

## What is Uranus ?
Uranus is a unofficial radio client for Listen.moe, It can play radio of both Japanese-POP music and Korean-POP music.

## How does it work ?
It fetches raw music streams in MP3 for both KPOP and JPOP from Listen.moe

```Music Stream```
- JPOP : [LINK](https://listen.moe/fallback)
- KPOP : [LINK](https://listen.moe/kpop/fallback)

The Data including Cover art, Title, Artist name is fetched from a Websocket provided by Listen.moe.

```Websockets```

- JPOP : wss://listen.moe/gateway_v2 
- KPOP : wss://listen.moe/kpop/gateway_v2

## Third Party Libraries 

- [Web Socket Channel](https://pub.dev/packages/web_socket_channel)
- [Google Fonts](https://pub.dev/packages/google_fonts)
- [Audio Players](https://pub.dev/packages/audioplayers)
- [Freezed](https://pub.dev/packages/freezed)
- [Freezed Annotation](https://pub.dev/packages/freezed_annotation)
- [JSON Serialiazable](https://pub.dev/packages/json_serializable)
- [Palette Generator](https://pub.dev/packages/palette_generator)


## Learn flutter
- [Flutter docs](https://docs.flutter.dev/)

## License
```MIT License
Copyright (c) 2022 Arjun Ingole

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```
