import { StatusBar } from 'expo-status-bar';
import { Text, View } from 'react-native';

export default function App() {
  return (
    <View className="flex-1 bg-white items-center justify-center">
      <Text className="text-4xl font-bold mb-2">🌱 PlantApp</Text>
      <Text className="text-lg text-gray-600">Welcome to your Plant App!</Text>
      <Text className="text-sm text-green-600 mt-4">✨ Powered by NativeWind</Text>
      <StatusBar style="auto" />
    </View>
  );
}

