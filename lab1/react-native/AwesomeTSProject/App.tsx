/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * Generated with the TypeScript template
 * https://github.com/react-native-community/react-native-template-typescript
 *
 * @format
 */

import React from 'react';

import {StyleSheet, Text, View, Image, Button, TextInput} from 'react-native';

const App = () => {
  return (
    <View
      style={{
        flex: 1,
        flexDirection: 'column',
        justifyContent: 'flex-start',
        alignItems: 'center',
      }}>
      <Image
        source={{uri: 'https://reactnative.dev/docs/assets/p_cat2.png'}}
        style={{
          width: 200,
          height: 200,
        }}
      />
      <View
        style={{
          margin: 10,
          width: '100%',
          flexDirection: 'row',
          justifyContent: 'space-around',
        }}>
        <Button color="grey" title="Button"></Button>
        <Button color="grey" title="Button"></Button>
      </View>

      <View
        style={{
          margin: 10,
          width: '100%',
          flexDirection: 'row',
          justifyContent: 'space-around',
        }}>
        <Button color="grey" title="Button"></Button>
        <Button color="grey" title="Button"></Button>
      </View>
      <View
        style={{
          margin: 40,
          width: '90%',
          flexDirection: 'row',
          justifyContent: 'flex-start',
          alignItems: 'center',
        }}>
        <Text>Email</Text>
        <TextInput
          selectionColor="red"
          style={{
            height: 40,
            marginLeft: 30,
            borderBottomWidth: 1,
            borderColor: 'red',
            width: '50%',
          }}></TextInput>
      </View>
    </View>
  );
};

export default App;
