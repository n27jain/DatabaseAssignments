import sklearn.tree as skt
import sklearn.metrics as skm
import pandas as pd

input_file = 'part_b.csv'
label_name = 'inducted'
model_max_depth = 5
model_min_samples_split = 8
model_min_samples_leaf = 1
training_proportion = 0.80
testing_proportion = 1. - training_proportion
output_importance = 0

numTests = 1

class Importance:
	def __init__(self, attr, weight):
		self.attr = attr
		self.weight = weight

def generateModel(data):
	# Shuffle data
	data = data.sample(frac=1).reset_index(drop=1)

	# Divide data into training set and testing set
	n = len(data)
	training_set = data.head(round(n * training_proportion))
	testing_set  = data.tail(round(n * testing_proportion ))

	# Get training set features and labels
	training_features = training_set[training_set.columns[1:-1]]
	training_labels   = training_set[[label_name]]

	# Get testing set features and labels
	testing_features = testing_set[testing_set.columns[1:-1]]
	testing_labels   = testing_set[[label_name]]

	# Create and train decision tree classifier
	clf = skt.DecisionTreeClassifier(max_depth=model_max_depth, min_samples_split=model_min_samples_split, min_samples_leaf=model_min_samples_leaf)
	clf = clf.fit(training_features, training_labels)
	return clf, training_features, training_labels, testing_features, testing_labels

def outputFeatureImportances(data, clf):
	# Get sorted list of importances for each attribute
	importances = []
	for i, col in enumerate(data.columns[1:-1]):
		importances.append(Importance(col, clf.feature_importances_[i]))
	importances = sorted(importances, key=(lambda i: i.weight))

	# Output attribute importances
	for importance in importances:
		print(f"{importance.attr}: {importance.weight}")

def testModel(clf, testing_features, testing_labels):
	predicted_labels = clf.predict(testing_features)

	# Compute performance metrics
	tn, fp, fn, tp = skm.confusion_matrix(testing_labels, predicted_labels).ravel()
	accuracy = (tp + tn) / float(tp + tn + fp + fn)
	recall = tp / float(tp + fn)
	precision = tp / float(tp + fp)
	specificity = tn / float(fp + tn)
	# print(f"<TP, TN, FP, FN> = <{tp}, {tn}, {fp}, {fn}>")
	# print(f"<accuracy, recall, precision, specificity> = <{accuracy}, {recall}, {precision}, {specificity}>")
	return accuracy, recall, precision, specificity

def main():
	# Load data
	data = pd.read_csv(input_file)
	avgAccuracy = 0
	avgRecall = 0
	avgPrecision = 0
	avgSpecificity = 0

	for i in range(0, numTests):
		# Generate model
		clf, training_features, training_labels, testing_features, testing_labels = generateModel(data)

		# Output feature importances
		if output_importance:
			outputFeatureImportances(data, clf)

		# Test decision tree classifier
		accuracy, recall, precision, specificity = testModel(clf, training_features, training_labels)

		avgAccuracy += accuracy
		avgRecall += recall
		avgPrecision += precision
		avgSpecificity += specificity

	print(f"<accuracy, recall, precision, specificity> = <{avgAccuracy / numTests}, {avgRecall / numTests}, {avgPrecision / numTests}, {avgSpecificity / numTests}>")

if (__name__ == "__main__"):
	main()