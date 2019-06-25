/* Necessary package imports */
import com.mathworks.toolbox.javabuilder.*;
import segmentRink.*;
import javax.imageio.*;
import java.awt.*;
import java.awt.image.*;
import java.io.*;
import java.util.Arrays;


class segRink {
	public static void main(String[] args) {
		String inputImagePath = args[0];
		String maskImageDir = args[1];
		String outputDir = args[2];

		String name = new File(inputImagePath).getName().split("\\.")[0];

		// Make output if it doesn't exist
		new File(outputDir).mkdirs();

		MWNumericArray input = null;
		MWNumericArray circlesMask = null;
		MWNumericArray goalCreaseMask = null;
		MWNumericArray trapezoidsMask = null;
		MWNumericArray vLinesMask = null;
		MWNumericArray hLinesMask = null;
		MWNumericArray curvaturesMask = null;
		MWNumericArray hashMarksMask = null;
		MWNumericArray faceoffLinesMask = null;
		MWNumericArray faceoffDotsMask = null;
		MWNumericArray refCreaseMask = null;

		SegmentCircles segmentCircles = null;
		SegmentGoalCreases segmentGoalCreases = null;
		SegmentTrapezoids segmentTrapezoids = null;
		SegmentVerticalLines segmentVLines = null;
		SegmentHLines segmentHLines = null;
		SegmentCurvatures segmentCurvatures = null;
		SegmentHashMarks segmentHashMarks = null;
		SegmentFaceoffLines segmentFaceoffLines = null;
		SegmentFaceoffDots segmentFaceoffDots = null;
		SegmentRefCrease segmentRefCrease = null;

		Object[] result = null; 

		try {
			input = readImage(inputImagePath);

			// Circles
			String circlesMaskName = combine(maskImageDir, "circles_mask" + name + ".jpg");
			circlesMask = readImage(circlesMaskName);

			segmentCircles = new SegmentCircles();

			result = segmentCircles.segmentCircles(1, input, circlesMask);
			segmentCircles.waitForFigures();

			BufferedImage circleColorMask = convertFrom3DUsingGetRGB(result, input.getDimensions());
			String circleColorPath = combine(outputDir, "color_circles_mask" + name + ".jpg");
			ImageIO.write(circleColorMask, "jpg", new File(circleColorPath));

			// Goal Creases
			String goalCreaseMaskName = combine(maskImageDir, "goalCreases_mask" + name + ".jpg");
			goalCreaseMask = readImage(goalCreaseMaskName);

			segmentGoalCreases = new SegmentGoalCreases();

			result = segmentGoalCreases.segmentGoalCreases(1, input, goalCreaseMask);
			segmentGoalCreases.waitForFigures();

			BufferedImage goalCreasesColorMask = convertFrom3DUsingGetRGB(result, input.getDimensions());
			String goalCreasesColorPath = combine(outputDir, "color_goalCreases_mask" + name + ".jpg");
			ImageIO.write(goalCreasesColorMask, "jpg", new File(goalCreasesColorPath));

			// Trapezoids
			String trapezoidsMaskName = combine(maskImageDir, "trapezoidLines_mask" + name + ".jpg");
			trapezoidsMask = readImage(trapezoidsMaskName);

			segmentTrapezoids = new SegmentTrapezoids();

			result = segmentTrapezoids.segmentTrapezoids(1, input, trapezoidsMask);
			segmentTrapezoids.waitForFigures();

			BufferedImage trapezoidsColorMask = convertFrom3DUsingGetRGB(result, input.getDimensions());
			String trapezoidsColorPath = combine(outputDir, "color_trapezoidLines_mask" + name + ".jpg");
			ImageIO.write(trapezoidsColorMask, "jpg", new File(trapezoidsColorPath));

			// Vertical Lines
			String vLinesMaskName = combine(maskImageDir, "vlines_mask" + name + ".jpg");
			vLinesMask = readImage(vLinesMaskName);

			segmentVLines = new SegmentVerticalLines();

			result = segmentVLines.segmentVLines(1, input, vLinesMask);
			segmentVLines.waitForFigures();

			BufferedImage vLinesColorMask = convertFrom3DUsingGetRGB(result, input.getDimensions());
			String vLinesColorPath = combine(outputDir, "color_vlines_mask" + name + ".jpg");
			ImageIO.write(vLinesColorMask, "jpg", new File(vLinesColorPath));

			// Horizontal Lines
			String hLinesMaskName = combine(maskImageDir, "hlines_mask" + name + ".jpg");
			hLinesMask = readImage(hLinesMaskName);

			segmentHLines = new SegmentHLines();

			result = segmentHLines.segmentHLines(1, input, hLinesMask);
			segmentHLines.waitForFigures();

			BufferedImage hLinesColorMask = convertFrom3DUsingGetRGB(result, input.getDimensions());
			String hLinesColorPath = combine(outputDir, "color_hlines_mask" + name + ".jpg");
			ImageIO.write(hLinesColorMask, "jpg", new File(hLinesColorPath));

			// Curvature
			String curvaturesMaskName = combine(maskImageDir, "curvatures_mask" + name + ".jpg");
			curvaturesMask = readImage(curvaturesMaskName);

			segmentCurvatures = new SegmentCurvatures();

			result = segmentCurvatures.segmentCurvatures(1, input, curvaturesMask);
			segmentCurvatures.waitForFigures();

			BufferedImage curvaturesColorMask = convertFrom3DUsingGetRGB(result, input.getDimensions());
			String curvaturesColorPath = combine(outputDir, "color_curvatures_mask" + name + ".jpg");
			ImageIO.write(curvaturesColorMask, "jpg", new File(curvaturesColorPath));

			// Hash marks
			String hashMarksMaskName = combine(maskImageDir, "hashMarks_mask" + name + ".jpg");
			hashMarksMask = readImage(hashMarksMaskName);

			segmentHashMarks = new SegmentHashMarks();

			result = segmentHashMarks.segmentHashMarks(1, input, hashMarksMask);
			segmentHashMarks.waitForFigures();

			BufferedImage hashMarksColorMask = convertFrom3DUsingGetRGB(result, input.getDimensions());
			String hashMarksColorPath = combine(outputDir, "color_hashMarks_mask" + name + ".jpg");
			ImageIO.write(hashMarksColorMask, "jpg", new File(hashMarksColorPath));

			// Faceoff Lines
			String faceoffLinesMaskName = combine(maskImageDir, "faceoffLines_mask_" + name + ".jpg");
			faceoffLinesMask = readImage(faceoffLinesMaskName);

			segmentFaceoffLines = new SegmentFaceoffLines();

			result = segmentFaceoffLines.segmentFaceoffLines(1, input, faceoffLinesMask);
			segmentFaceoffLines.waitForFigures();

			BufferedImage faceoffLinesColorMask = convertFrom3DUsingGetRGB(result, input.getDimensions());
			String faceoffLinesColorPath = combine(outputDir, "color_faceoffLines_mask" + name + ".jpg");
			ImageIO.write(faceoffLinesColorMask, "jpg", new File(faceoffLinesColorPath));

			// Faceoff Dots
			String faceoffDotsMaskName = combine(maskImageDir, "faceoffDots_mask" + name + ".jpg");
			faceoffDotsMask = readImage(faceoffDotsMaskName);

			segmentFaceoffDots = new SegmentFaceoffDots();

			result = segmentFaceoffDots.segmentFaceoffDots(1, input, faceoffDotsMask);
			segmentFaceoffDots.waitForFigures();

			BufferedImage faceoffDotsColorMask = convertFrom3DUsingGetRGB(result, input.getDimensions());
			String faceoffDotsColorPath = combine(outputDir, "color_faceoffDots_mask" + name + ".jpg");
			ImageIO.write(faceoffDotsColorMask, "jpg", new File(faceoffDotsColorPath));

			// Ref Crease
			String refCreaseMaskName = combine(maskImageDir, "refCrease_mask" + name + ".jpg");
			refCreaseMask = readImage(refCreaseMaskName);

			segmentRefCrease = new SegmentRefCrease();

			result = segmentRefCrease.segmentRefCrease(1, input, refCreaseMask);
			segmentRefCrease.waitForFigures();

			// This may throw an error
			BufferedImage refCreaseColorMask = convertFrom3DUsingGetRGB(result, input.getDimensions());
			String refCreaseColorPath = combine(outputDir, "color_refCrease_mask" + name + ".jpg");
			ImageIO.write(refCreaseColorMask, "jpg", new File(refCreaseColorPath));

		} catch (Exception e) {
			System.out.println("Exception: " + e);
		} finally {
			/* Free native resources */
			MWArray.disposeArray(input);
			MWArray.disposeArray(circlesMask);
			MWArray.disposeArray(goalCreaseMask);
			MWArray.disposeArray(trapezoidsMask);
			MWArray.disposeArray(vLinesMask);
			MWArray.disposeArray(hLinesMask);
			MWArray.disposeArray(curvaturesMask);
			MWArray.disposeArray(hashMarksMask);
			MWArray.disposeArray(faceoffLinesMask);
			MWArray.disposeArray(faceoffDotsMask);
			MWArray.disposeArray(refCreaseMask);

			try {
				segmentCircles.dispose();
				segmentGoalCreases.dispose();
				segmentTrapezoids.dispose();
				segmentHLines.dispose();
				segmentVLines.dispose();
				segmentCurvatures.dispose();
				segmentHashMarks.dispose();
				segmentFaceoffLines.dispose();
				segmentFaceoffDots.dispose();
				segmentRefCrease.dispose();

			} catch (Exception e) { }
		}
	}

	private static MWNumericArray readImage(String imagePath) {
		BufferedImage img = null;

		try {
			img = ImageIO.read(new File(imagePath));
			System.out.println("Read " + imagePath);
		} catch (IOException e) {
			System.out.println("Exception: " + e.toString());
		}

		int width = img.getWidth();
		int height = img.getHeight();

		double[][][] imgArr = convertTo3DUsingGetRGB(img, width, height);

		int[] dims = {height, width, 3};

		MWNumericArray x = MWNumericArray.newInstance(dims, MWClassID.DOUBLE, MWComplexity.REAL);

		for (int i = 0; i < height; i++) {
			for (int j = 0; j < width; j++) {
				for (int k = 0; k < 3; k++) {
					int index[] = {i + 1, j + 1, k + 1};
					x.set(index, imgArr[i][j][k]);
				}
			}
		}

		return x;
	}
   
	private static double[][][] convertTo3DUsingGetRGB(BufferedImage image,  int width, int height) {
	// From https://stackoverflow.com/questions/6524196/java-get-pixel-array-from-image

		double[][][] result = new double[height][width][3];

		for (int row = 0; row < height; row++) {
			for (int col = 0; col < width; col++) {
				Color mycolour = new Color(image.getRGB(col, row));

				result[row][col][0] = mycolour.getRed() / 255.0;
				result[row][col][1] = mycolour.getGreen() / 255.0;
				result[row][col][2] = mycolour.getBlue() / 255.0;
			}
		}

		return result;
	}

	private static BufferedImage convertFrom3DUsingGetRGB(Object[] result, int[] dim) {
		MWNumericArray colorCirclesMaskIn = (MWNumericArray) result[0];

		BufferedImage colorCirclesMask = new BufferedImage(dim[1], dim[0], BufferedImage.TYPE_INT_RGB);

		float maxRed = -1000;
		float minRed = 1000;

		try {
			for (int row = 0; row < dim[0]; row++) {
				for (int col = 0; col < dim[1]; col++) {
					int index[] = {row + 1, col + 1, 1};
					Byte redByte = (Byte) colorCirclesMaskIn.get(index);
					int red = redByte.intValue();

					if (red == -1) {
						red = 255;
					}

					int index2[] = {row + 1, col + 1, 2};
					Byte greenByte = (Byte) colorCirclesMaskIn.get(index2);
					int green = greenByte.intValue();

					if (green == -1) {
						green = 255;
					} else if (green == -128) { // vertical lines
						green = 128;
					} else if (green == -103) { // hash marks
						green = 153;
					}

					int index3[] = {row + 1, col + 1, 3};
					Byte blueByte = (Byte) colorCirclesMaskIn.get(index3);
					int blue = blueByte.intValue();

					if (blue == -1) {
						blue = 255;
					} else if (blue == -103) { // idk what's going on (curvature)
						blue = 153;
					}

					Color mycolour = new Color((float) red / 255, (float) green / 255, (float) blue / 255); 
					colorCirclesMask.setRGB(col, row, mycolour.getRGB());

				}
			}
		} catch (Exception e) {
			System.out.println("Something went wrong while converting to image.")
			System.out.println(e);
		}

		return colorCirclesMask;
	}

	public static String combine(String path1, String path2) {
	// From https://stackoverflow.com/questions/412380/how-to-combine-paths-in-java
	    File file1 = new File(path1);
	    File file2 = new File(file1, path2);
	    return file2.getPath();
	}

   
//    private static int[][] convertTo2DWithoutUsingGetRGB(BufferedImage image) {
//    // From https://stackoverflow.com/questions/6524196/java-get-pixel-array-from-image
// 
//       final byte[] pixels = ((DataBufferByte) image.getRaster().getDataBuffer()).getData();
//       final int width = image.getWidth();
//       final int height = image.getHeight();
//       final boolean hasAlphaChannel = image.getAlphaRaster() != null;
// 
//       int[][] result = new int[height][width];
//       if (hasAlphaChannel) {
//           System.out.println("has alpha channel");
// //          final int pixelLength = 4;
// //          for (int pixel = 0, row = 0, col = 0; pixel + 3 < pixels.length; pixel += pixelLength) {
// //             int argb = 0;
// //             argb += (((int) pixels[pixel] & 0xff) << 24); // alpha
// //             argb += ((int) pixels[pixel + 1] & 0xff); // blue
// //             argb += (((int) pixels[pixel + 2] & 0xff) << 8); // green
// //             argb += (((int) pixels[pixel + 3] & 0xff) << 16); // red
// //             result[row][col] = argb;
// //             col++;
// //             if (col == width) {
// //                col = 0;
// //                row++;
// //             }
// //          }
//       } else {
//          System.out.println("no alpha channel");
//          final int pixelLength = 3;
//          for (int pixel = 0, row = 0, col = 0; pixel + 2 < pixels.length; pixel += pixelLength) {
//             int argb = 0;
//             argb += -16777216; // 255 alpha
//             argb += ((int) pixels[pixel] & 0xff); // blue
//             argb += (((int) pixels[pixel + 1] & 0xff) << 8); // green
//             argb += (((int) pixels[pixel + 2] & 0xff) << 16); // red
//             System.out.println(((int) pixels[pixel + 2] & 0xff) << 16); // red
//             result[row][col] = argb;
//             col++;
//             if (col == width) {
//                col = 0;
//                row++;
//             }
//          }
//       }
// 
//       return result;
//    }
}
