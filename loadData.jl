module DataLoading
  import GZip
  export gettrainingexamples, gettraininglabels, gettestimages, gettestlabels

  const TRAINING_IMAGES_URL = "http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz"
  const TRAINING_LABELS_URL = "http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz"
  const TEST_IMAGES_URL = "http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz"
  const TEST_LABELS_URL = "http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz"

  function gettrainingexamples()
    readordownloadfile("./data/trainingImages", TRAINING_IMAGES_URL)
  end

  function gettraininglabels()
    readordownloadfile("./data/trainingLabels", TRAINING_LABELS_URL)
  end

  function gettestimages()
    readordownloadfile("./data/testImages", TEST_IMAGES_URL)
  end

  function gettestlabels()
    readordownloadfile("./data/testLabels", TEST_LABELS_URL)
  end

  function readfile(filepath)
    GZip.open(filepath)
  end

  function readordownloadfile(filepath, url)
    try
      readfile(filepath)
    catch e
      println("Error reading file $(filepath), downloading from $(url)")

      download(url, filepath)
      readfile(filepath)
    end
  end
end
