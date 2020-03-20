
import UIKit

class AdjustsViewController: MSLViewController<AdjustsViewModel> {

    //MARK: -
    //MARK: - OUTLETS
    private var dolarStackView: UIStackView!
    private var dolarLabel: UILabel!
    private var dolarValueTextField: MSLTextField!
    private var iofStackView: UIStackView!
    private var iofLabel: UILabel!
    private var iofTextField: MSLTextField!
    private var titleLabel: UILabel!
    private var tableView: UITableView!
    private var addStateButton: UIButton!
    
    //MARK: -
    //MARK: - VIEW CODE LIFE CYCLE
    override func prepareViews() {
        dolarStackView = .init()
        dolarValueTextField = .init()
        dolarLabel = .init()
        iofStackView = .init()
        iofTextField = .init()
        iofLabel = .init()
        titleLabel = .init()
        tableView = .init()
        addStateButton = .init()
    }
    
    override func addViewHierarchy() {
        dolarStackView.addArrangedSubviews([
            dolarLabel,
            dolarValueTextField
        ])
        
        iofStackView.addArrangedSubviews([
            iofLabel,
            iofTextField
        ])
        
        view.addSubviews([
            dolarStackView,
            iofStackView,
            titleLabel,
            tableView,
            addStateButton
        ])
    }
    
    override func setupConstraints() {
        
        dolarStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.left.right.equalToSuperview().offset(20)
            make.height.equalTo(40)
        }
        
        iofStackView.snp.makeConstraints { make in
            make.top.equalTo(dolarStackView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().offset(16)
            make.height.equalTo(40)
        }
        
        iofLabel.snp.makeConstraints { make in
            make.top.equalTo(iofStackView.snp.bottom).offset(30)
            make.centerY.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(iofLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().offset(16)
        }
        
        addStateButton.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(16)
            make.bottom.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(16)
            make.height.equalTo(35)
        }
    }
    
    override func configureViews() {
        view.backgroundColor = .white
        configureDolarViews()
        configureIOFViews()
        configureTitleLabel()
    }
    
    private func configureDolarViews() {
        dolarLabel.text = "Cotação do dólar (R$):"
        dolarLabel.textAlignment = .right
        
        dolarValueTextField.textAlignment = .right
        dolarValueTextField.placeholder = "0.0"
        
        dolarStackView.axis = .horizontal
        dolarStackView.alignment = .center
        dolarStackView.distribution = .equalCentering
        dolarStackView.spacing = 10
    }
    
    private func configureIOFViews() {
        iofLabel.text = "IOF (%):"
        iofLabel.textAlignment = .right
        
        iofTextField.textAlignment = .right
        iofTextField.placeholder = "0.0"
    }
    
    private func configureTitleLabel() {
        titleLabel.text = "Impostos por estado"
        titleLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
    }

}
