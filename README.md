Prebuilt transitions for Animated Switcher such as flip, zoom and translation.

<h1 align="center">
<img src="https://raw.githubusercontent.com/hoomanmmd/animated_switcher_plus/main/preview/preview.gif" alt="AnimatedSwitcherPlus" />
</h1>

## Transitions
+ AnimatedSwitcherPlus.flipX  
+ AnimatedSwitcherPlus.flipY  
+ AnimatedSwitcherPlus.zoomIn  
+ AnimatedSwitcherPlus.zoomOut
+ AnimatedSwitcherPlus.translationLeft
+ AnimatedSwitcherPlus.translationRight
+ AnimatedSwitcherPlus.translationTop
+ AnimatedSwitcherPlus.translationBottom

## Features
+ Easily animate between two widgets
+ No need to provide both the first and second child simultaneously, unlike similar packages

# Installation
Add this line to your pubspec:
```yaml  
dependencies:  
 animated_switcher_plus: ^1.1.1
```  

## Usage

```  
AnimatedSwitcherPlus.flipX(  
 duration: const Duration(milliseconds: 1500),
 child: _showFirstChild ?
  const Text('Primary Text', key: ValueKey(0)) :
  const Text('Secondary Text', key: ValueKey(1)),
);  
```  

Note: If you are using the same type of widget, change the child key to notify the AnimatedSwitcher that the child has changed. Otherwise, the transition will not occur