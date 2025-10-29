import SwiftUI

// Define our 525nm spectral green color
extension Color {
    // Display P3 color using UIColor bridge
    static let spectral525nm = Color(uiColor: UIColor(displayP3Red: 0.29, green: 1.0, blue: 0.0, alpha: 1.0))
    
    // sRGB fallback
    static let spectral525nmSRGB = Color(red: 74/255, green: 255/255, blue: 0/255)
    
    // Standard CSS lime for comparison
    static let cssLime = Color(red: 0, green: 1.0, blue: 0)
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Header
                Text("525nm Spectral Green Test")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                // Main color display
                VStack(spacing: 10) {
                    Text("Display P3 Approximation")
                        .font(.headline)
                    
                    Rectangle()
                        .fill(Color.spectral525nm)
                        .frame(height: 200)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    Text("~80% spectral purity on P3 displays")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
                
                // Comparison section
                VStack(alignment: .leading, spacing: 15) {
                    Text("Color Comparisons")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    // 525nm Display P3
                    HStack {
                        Rectangle()
                            .fill(Color.spectral525nm)
                            .frame(width: 80, height: 80)
                            .cornerRadius(8)
                        
                        VStack(alignment: .leading) {
                            Text("525nm (Display P3)")
                                .fontWeight(.semibold)
                            Text("rgb(0.29, 1.0, 0.0)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    
                    // 525nm sRGB fallback
                    HStack {
                        Rectangle()
                            .fill(Color.spectral525nmSRGB)
                            .frame(width: 80, height: 80)
                            .cornerRadius(8)
                        
                        VStack(alignment: .leading) {
                            Text("525nm (sRGB)")
                                .fontWeight(.semibold)
                            Text("#4aff00")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    
                    // Standard CSS lime
                    HStack {
                        Rectangle()
                            .fill(Color.cssLime)
                            .frame(width: 80, height: 80)
                            .cornerRadius(8)
                        
                        VStack(alignment: .leading) {
                            Text("CSS Lime (#00ff00)")
                                .fontWeight(.semibold)
                            Text("~549nm wavelength")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                    }
                }
                .padding()
                
                // Text examples
                VStack(spacing: 15) {
                    Text("Text in 525nm Green")
                        .font(.title)
                        .foregroundColor(.spectral525nm)
                    
                    Text("This color is more cyan-shifted than standard lime green, appearing closer to 'pure' green perception.")
                        .foregroundColor(.spectral525nm)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                // Info box
                VStack(alignment: .leading, spacing: 10) {
                    Text("Technical Details")
                        .font(.headline)
                    
                    Text("• This approximates 525nm monochromatic light")
                    Text("• Achieves ~70-80% of true spectral saturation")
                    Text("• Uses Display P3 color space (25% larger than sRGB)")
                    Text("• All iPhones since iPhone 7 support Display P3")
                }
                .padding()
                .background(Color.spectral525nm.opacity(0.1))
                .cornerRadius(10)
                .padding()
                
            }
            .padding()
        }
    }
}

// Preview for Xcode 14.2 (older preview syntax)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
