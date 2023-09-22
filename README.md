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
+ Easily animate between two widget
+ No need to provide first and second child at the same time, compare to similar packages

# Installation
Add this line to your pubspec:
```yaml  
dependencies:  
 animated_switcher_plus: ^1.1.0
```  

## Usage

```  
AnimatedSwitcherFlip.flipX(  
 duration: const Duration(milliseconds: 1500),
 child: _showFirstChild ?
  const Text('Primary Text', key: ValueKey(0)) :
  const Text('Secondary Text', key: ValueKey(1)),
);  
```  

Note: Change child's key in order to notify AnimatedSwitcher that child has been changed, otherwise transition won't happen.
