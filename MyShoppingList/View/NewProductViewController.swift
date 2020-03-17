
import UIKit
import SnapKit

class NewProductViewController: MSLViewController<NewProductViewModel> {

    //MARK: -
    //MARK: - OUTLETS
    private var productTextField: UITextField!
    private var productImageView: UIImageView!
    private var stateStackView: UIStackView!
    private var stateTextField: UITextField!
    private var addStateButton: UIButton!
    private var valueStackView: UIStackView!
    private var valueTextField: UITextField!
    private var switchLabel: UILabel!
    private var cardSwitch: UISwitch!
    private var saveButton: UIButton!
    
    private var stateView: UIView!
    private var cancelButton: UIButton!
    private var doneButton: UIButton!
    private var statePickerView: UIPickerView!
    
    
    var stateIndex = 0
    
    //MARK: -
    //MARK: - VIEW CODE LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepareViews() {
        view.backgroundColor = .white
        productTextField = .init()
        productImageView = .init()
        stateTextField = .init()
        addStateButton = .init()
        valueTextField = .init()
        switchLabel = .init()
        cardSwitch = .init()
        saveButton = .init()
        stateStackView = .init()
        valueStackView = .init()
        
        stateView = .init()
        cancelButton = .init()
        doneButton = .init()
        statePickerView = .init()
    }
    
    override func addViewHierarchy() {
    
        stateStackView.addArrangedSubviews([
            stateTextField,
            addStateButton
        ])
        
        valueStackView.addArrangedSubviews([
            valueTextField,
            switchLabel,
            cardSwitch
        ])
        
        stateView.addSubviews([
            cancelButton,
            doneButton,
            statePickerView
        ])
        
        view.addSubviews([
            productTextField,
            productImageView,
            stateStackView,
            valueStackView,
            saveButton,
            stateView
        ])
    }
    
    //MARK: -
    //MARK: - VIEW CONFIGURATIONS
    override func setupConstraints() {
        
        productTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(productTextField.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(140)
        }
        
        addStateButton.snp.makeConstraints { make in
            make.height.width.equalTo(32)
        }
        
        stateTextField.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        
        valueTextField.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        
        stateStackView.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        valueStackView.snp.makeConstraints { make in
            make.top.equalTo(stateStackView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(valueStackView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        stateView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(UIWindow.getSafeAreaInsets().bottom+50)
            make.height.equalTo(200)
        }
        
        statePickerView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(40)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(36)
        }
        
        doneButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(36)
            make.centerY.equalTo(cancelButton.snp.centerY)
        }
        
    }

    override func configureViews() {
        configureProductTextField()
        configureAddButton()
        configureState()
        configuereValue()
        configureSaveButton()
        configureStateView()
    }
    
    private func configureProductTextField() {
        productTextField.placeholder = "Nome do produto"
        productTextField.borderStyle = .roundedRect
    }
    
    private func configureState() {
        stateTextField.placeholder = "Estado da compra"
        stateTextField.borderStyle = .roundedRect
        
        stateStackView.axis = .horizontal
        stateStackView.alignment = .center
        stateStackView.distribution = .fill
        stateStackView.spacing = 10
    }
    
    private func configuereValue() {
        valueTextField.placeholder = "Valor (U$)"
        valueTextField.borderStyle = .roundedRect
        switchLabel.text = "Cartão?"
        cardSwitch.isOn = true
        
        valueStackView.axis = .horizontal
        valueStackView.alignment = .center
        valueStackView.distribution = .fill
        valueStackView.spacing = 10
    }
    
    private func configureAddButton() {
        addStateButton.layer.borderColor = UIColor.blue.cgColor
        addStateButton.layer.borderWidth = 1.0
        addStateButton.layer.cornerRadius = 16
        addStateButton.setTitle("+", for: .normal)
        addStateButton.setTitleColor(.blue, for: .normal)
        addStateButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        addStateButton.addTarget(self, action: #selector(addStateTapped(_ :)), for: .touchUpInside)
    }
    
    private func configureSaveButton() {
        saveButton.backgroundColor = .blue
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.setTitle("CADASTRAR", for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonTapped(_ :)), for: .touchUpInside)
    }
    
    private func configureStateView() {
        stateView.backgroundColor = .lightGray
        stateView.isHidden = true
        
        cancelButton.setTitle("Cancelar", for: .normal)
        cancelButton.setTitleColor(.blue, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped(_ :)), for: .touchUpInside)
        
        doneButton.setTitle("Pronto", for: .normal)
        doneButton.setTitleColor(.blue, for: .normal)
        doneButton.addTarget(self, action: #selector(doneButtonTapped(_ :)), for: .touchUpInside)
        
        statePickerView.backgroundColor = .white
        statePickerView.delegate = self
        statePickerView.dataSource = self
    }
    
    //MARK: -
    //MARK: - BUTTON ACTIONS
    @objc private func addStateTapped(_ sender: UIButton) {
        statePickerView.reloadAllComponents()
        stateView.isHidden = false
    }
    
    @objc private func cancelButtonTapped(_ sender: UIButton) {
        stateView.isHidden = true
    }
    
    @objc private func doneButtonTapped(_ sender: UIButton) {
        vm.didSelectState(at: stateIndex)
    }
    
    @objc private func saveButtonTapped(_ sender: UIButton) {
        let product = Product()
        product.id = UUID().uuidString
        product.name = productTextField.text ?? ""
        product.image = productImageView.image?.pngData()
        product.value = valueTextField.text?.getDoubleValue() ?? 0
        product.isCreditCard = cardSwitch.isOn
        vm.save(product: product) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
}


extension NewProductViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return vm.statesNumberOfRows
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        stateIndex = row
    }
    
}
